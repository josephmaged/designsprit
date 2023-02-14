part of 'login_cubit.dart';

class LoginState extends Equatable {
  final LoginResponse? loginResponse;
  final RequestState? requestState;
  final String? loginMessage;
  final UserCredential? userCredential;
  final bool? isPassword;
  final bool? checkState;

  const LoginState({
    this.loginResponse,
    this.requestState,
    this.loginMessage,
    this.userCredential,
    this.isPassword,
    this.checkState
  });

  LoginState copyWith({
    LoginResponse? loginResponse,
    RequestState? requestState,
    String? loginMessage,
    UserCredential? userCredential,
    bool? isPassword,
    bool? checkState
  }) {
    return LoginState(
      loginResponse: loginResponse ?? this.loginResponse,
      requestState: requestState ?? this.requestState,
      loginMessage: loginMessage ?? this.loginMessage,
      userCredential: userCredential ?? this.userCredential,
      isPassword: isPassword ?? this.isPassword,
      checkState: checkState ?? this.checkState,
    );
  }

  @override
  List<Object?> get props => [
    loginResponse,
    requestState,
    loginMessage,
    userCredential,
    isPassword,
    checkState,
  ];
}