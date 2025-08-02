part of 'step_bloc.dart';

abstract class StepEvent  {
  const StepEvent();

  @override
  List<Object?> get props => [];
}

class RequestPermissionEvent extends StepEvent {}

class StepCountChangedEvent extends StepEvent {
  final int steps;

  const StepCountChangedEvent(this.steps);

  @override
  List<Object?> get props => [steps];
}

class ResetInitialStepsEvent extends StepEvent {}
