part of 'status_cubit.dart';

class StatusState extends Equatable {
  final List<ProjectSteps>? projectSteps;
  final RequestState? requestState;
  final String? responseMessage;
  final int? stepIndex;

  const StatusState({this.projectSteps, this.requestState, this.responseMessage, this.stepIndex});

  StatusState copyWith({
    List<ProjectSteps>? projectSteps,
    RequestState? requestState,
    String? responseMessage,
    int? stepIndex,
  }) {
    return StatusState(
      projectSteps: projectSteps ?? this.projectSteps,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
      stepIndex: stepIndex ?? this.stepIndex,
    );
  }

  List<Object?> get props => [
        projectSteps,
        requestState,
        responseMessage,
        stepIndex,
      ];
}
