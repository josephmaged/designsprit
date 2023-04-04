part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<Notifications> requestResponse;
  final List<ApiResponse> apiResponse;
  final RequestState requestState;
  final String responseMessage;

  const NotificationsState({
    this.requestResponse = const [],
    this.apiResponse = const [],
    this.requestState = RequestState.loading,
    this.responseMessage = '',
  });

  NotificationsState copyWith({
    List<Notifications>? requestResponse,
    List<ApiResponse>? apiResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return NotificationsState(
      requestResponse: requestResponse ?? this.requestResponse,
      apiResponse: apiResponse ?? this.apiResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        requestResponse,
        apiResponse,
        requestState,
        responseMessage,
      ];
}
