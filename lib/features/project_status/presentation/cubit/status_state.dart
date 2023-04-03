part of 'status_cubit.dart';

class StatusState extends Equatable {
  final List<Projects>? projects;
  final List<Steps>? steps;
  final ApiResponse? apiResponse;
  final RequestState? requestState;
  final RequestState? stepsState;
  final String? responseMessage;
  final int? stepIndex;

  const StatusState({
    this.projects,
    this.steps,
    this.apiResponse,
    this.requestState,
    this.stepsState,
    this.responseMessage,
    this.stepIndex,
  });

  StatusState copyWith({
    List<Projects>? projects,
    List<Steps>? steps,
    apiResponse,
    RequestState? requestState,
    RequestState? stepsState,
    String? responseMessage,
    int? stepIndex,
  }) {
    return StatusState(
      projects: projects ?? this.projects,
      steps: steps ?? this.steps,
      apiResponse: apiResponse ?? this.apiResponse,
      requestState: requestState ?? this.requestState,
      stepsState: stepsState ?? this.stepsState,
      responseMessage: responseMessage ?? this.responseMessage,
      stepIndex: stepIndex ?? this.stepIndex,
    );
  }

  List<Object?> get props =>
      [
        projects,
        steps,
        apiResponse,
        requestState,
        stepsState,
        responseMessage,
        stepIndex,
      ];
}
