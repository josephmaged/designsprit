part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final List<Notifications>? requestResponse;
  final RequestState? requestState;
  final String? responseMessage;

  const NotificationsState({
    this.requestResponse,
    this.requestState,
    this.responseMessage,
  });

  NotificationsState copyWith({
    List<Notifications>? requestResponse,
    RequestState? requestState,
    String? responseMessage,
  }) {
    return NotificationsState(
      requestResponse: requestResponse ?? this.requestResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
    );
  }

  @override
  List<Object?> get props => [
        requestResponse,
        requestState,
        responseMessage,
      ];
}
