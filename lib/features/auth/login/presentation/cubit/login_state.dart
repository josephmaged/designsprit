part of 'login_cubit.dart';

class LoginState extends Equatable {
  final List<LoginResponseModel>? loginResponse;
  final RequestState? requestState;
  final String? responseMessage;
  final UserCredential? userCredential;
  final bool? isPassword;
  final bool? checkState;

  const LoginState({
    this.loginResponse,
    this.requestState,
    this.responseMessage,
    this.userCredential,
    this.isPassword,
    this.checkState
  });

  LoginState copyWith({
    List<LoginResponseModel>? loginResponse,
    RequestState? requestState,
    String? responseMessage,
    UserCredential? userCredential,
    bool? isPassword,
    bool? checkState
  }) {
    return LoginState(
      loginResponse: loginResponse ?? this.loginResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
      userCredential: userCredential ?? this.userCredential,
      isPassword: isPassword ?? this.isPassword,
      checkState: checkState ?? this.checkState,
    );
  }

  @override
  List<Object?> get props => [
    loginResponse,
    requestState,
    responseMessage,
    userCredential,
    isPassword,
    checkState,
  ];
}