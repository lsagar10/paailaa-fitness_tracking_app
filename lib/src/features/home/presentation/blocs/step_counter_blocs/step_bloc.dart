import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'step_event.dart';
part 'step_state.dart';

class StepBloc extends Bloc<StepEvent, StepState> {
  StreamSubscription<StepCount>? _stepSubscription;
  int? _initialSteps;
  final int dailyGoal = 10000;

  StepBloc() : super(StepInitial()) {
    on<RequestPermissionEvent>(_onRequestPermission);
    on<StepCountChangedEvent>(_onStepCountChanged);
    on<ResetInitialStepsEvent>(_onResetInitialSteps);
  }

  Future<void> _onRequestPermission(
      RequestPermissionEvent event, Emitter<StepState> emit) async {
    emit(StepLoading());

    var status = await Permission.activityRecognition.request();
    if (status != PermissionStatus.granted) {
      emit(StepPermissionDenied());
      return;
    }

    await _loadInitialSteps();

    // Start listening to pedometer stream
    _stepSubscription?.cancel();
    _stepSubscription = Pedometer.stepCountStream.listen(
      (stepCount) {
        add(StepCountChangedEvent(stepCount.steps));
      },
      onError: (error) {
        emit(StepError(error.toString()));
      },
      cancelOnError: true,
    );

    emit(StepTracking(stepsDone: 0, dailyGoal: dailyGoal));
  }

  Future<void> _loadInitialSteps() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    final storedDate = prefs.getString('step_date');
    final storedSteps = prefs.getInt('initial_steps');

    if (storedDate == today && storedSteps != null) {
      _initialSteps = storedSteps;
    } else {
      _initialSteps = null;
      await prefs.remove('initial_steps');
      await prefs.setString('step_date', today);
    }
  }

  Future<void> _saveInitialSteps(int steps) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    await prefs.setInt('initial_steps', steps);
    await prefs.setString('step_date', today);
  }

  void _onStepCountChanged(
      StepCountChangedEvent event, Emitter<StepState> emit) async {
    if (_initialSteps == null) {
      _initialSteps = event.steps;
      await _saveInitialSteps(_initialSteps!);
    }

    int stepsDone = event.steps - _initialSteps!;
    if (stepsDone < 0) stepsDone = 0; // Handle device reset or negative steps

    emit(StepTracking(stepsDone: stepsDone, dailyGoal: dailyGoal));
  }

  void _onResetInitialSteps(
      ResetInitialStepsEvent event, Emitter<StepState> emit) async {
    _initialSteps = null;
    await _saveInitialSteps(0);
    emit(StepTracking(stepsDone: 0, dailyGoal: dailyGoal));
  }

  @override
  Future<void> close() {
    _stepSubscription?.cancel();
    return super.close();
  }
}
