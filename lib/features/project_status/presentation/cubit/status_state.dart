part of 'status_cubit.dart';

class StatusState extends Equatable {
  final List<ProjectSteps>? projectSteps;
  final ApiResponse? apiResponse;
  final RequestState? requestState;
  final String? responseMessage;
  final int? stepIndex;

  const StatusState({this.apiResponse, this.projectSteps, this.requestState, this.responseMessage, this.stepIndex});

  StatusState copyWith({
    List<ProjectSteps>? projectSteps,
    ApiResponse? apiResponse,
    RequestState? requestState,
    String? responseMessage,
    int? stepIndex,
  }) {
    return StatusState(
      projectSteps: projectSteps ?? this.projectSteps,
      apiResponse: apiResponse ?? this.apiResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
      stepIndex: stepIndex ?? this.stepIndex,
    );
  }

  List<Object?> get props => [
        projectSteps,
        apiResponse,
        requestState,
        responseMessage,
        stepIndex,
      ];
}
