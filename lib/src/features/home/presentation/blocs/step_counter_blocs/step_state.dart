part of 'step_bloc.dart';

abstract class StepState  {
  const StepState();

  @override
  List<Object?> get props => [];
}

class StepInitial extends StepState {}

class StepLoading extends StepState {}

class StepPermissionDenied extends StepState {}

class StepTracking extends StepState {
  final int stepsDone;
  final int dailyGoal;

  const StepTracking({required this.stepsDone, required this.dailyGoal});

  @override
  List<Object?> get props => [stepsDone, dailyGoal];
}

class StepError extends StepState {
  final String message;

  const StepError(this.message);

  @override
  List<Object?> get props => [message];
}
