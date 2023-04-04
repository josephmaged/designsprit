part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  final bool? isCurrentPassword;
  final bool? isPassword;
  final String? responseMessage;
  final RequestState? requestState;

  const ChangePasswordState({
    this.isCurrentPassword,
    this.isPassword,
    this.responseMessage,
    this.requestState,
  });

  ChangePasswordState copyWith({
    bool? isPassword,
    bool? isCurrentPassword,
    String? responseMessage = "",
    RequestState? requestState,
  }) {
    return ChangePasswordState(
      isPassword: isPassword ?? this.isPassword,
      isCurrentPassword: isCurrentPassword ?? this.isCurrentPassword,
      responseMessage: responseMessage ?? this.responseMessage,
      requestState: requestState ?? this.requestState,
    );
  }

  @override
  List<Object?> get props => [isPassword, isCurrentPassword, responseMessage, requestState];
}
