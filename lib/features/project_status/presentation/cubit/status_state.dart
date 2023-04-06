part of 'status_cubit.dart';

class StatusState extends Equatable {
  final List<Projects>? projects;
  final List<Steps>? steps;
  final List<ApiResponse>? apiResponse;
  final List<Installments>? installments;
  final RequestState? requestState;
  final RequestState? stepsState;
  final String? responseMessage;
  final int? stepIndex;

  const StatusState({
     this.projects = const [],
    this.steps,
    this.apiResponse,
    this.installments,
    this.requestState,
    this.stepsState,
    this.responseMessage,
    this.stepIndex,
  });

  StatusState copyWith({
    List<Projects>? projects,
    List<Steps>? steps,
    List<ApiResponse>? apiResponse,
    List<Installments>? installments,
    RequestState? requestState,
    RequestState? stepsState,
    String? responseMessage,
    int? stepIndex = 0,
  }) {
    return StatusState(
      projects: projects ?? this.projects,
      steps: steps ?? this.steps,
      apiResponse: apiResponse ?? this.apiResponse,
      installments: installments ?? this.installments,
      requestState: requestState ?? this.requestState,
      stepsState: stepsState ?? this.stepsState,
      responseMessage: responseMessage ?? this.responseMessage,
      stepIndex: stepIndex ?? this.stepIndex,
    );
  }

  @override
  List<Object?> get props =>
      [
        projects,
        steps,
        apiResponse,
        installments,
        requestState,
        stepsState,
        responseMessage,
        stepIndex,
      ];
}
