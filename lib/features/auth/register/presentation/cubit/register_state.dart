part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final List<RegisterResponse>? registerResponse;
  final RequestState? requestState;
  final String? responseMessage;
  final UserCredential? userCredential;
  final bool? isPassword;
  final bool? checkState;

  const RegisterState({
    this.registerResponse,
    this.requestState,
    this.responseMessage,
    this.userCredential,
    this.isPassword,
    this.checkState
  });

  RegisterState copyWith({
    List<RegisterResponse>? registerResponse,
    RequestState? requestState,
    String? responseMessage,
    UserCredential? userCredential,
    bool? isPassword,
    bool? checkState
  }) {
    return RegisterState(
      registerResponse: registerResponse ?? this.registerResponse,
      requestState: requestState ?? this.requestState,
      responseMessage: responseMessage ?? this.responseMessage,
      userCredential: userCredential ?? this.userCredential,
      isPassword: isPassword ?? this.isPassword,
      checkState: checkState ?? this.checkState,
    );
  }

  @override
  List<Object?> get props => [
    registerResponse,
    requestState,
    responseMessage,
    userCredential,
    isPassword,
    checkState,
  ];
}

/*
class RegisterChangePasswordVisibilityState extends RegisterState {
  const RegisterChangePasswordVisibilityState(bool isPassword);
}

class RegisterChangeRememberMeState extends RegisterState {}
*/

/*class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {
  ApiResponse<RegisterResponse>? user;
  dynamic userdata;

  RegisterSuccess({this.user, this.userdata});
}

class RegisterFailure extends RegisterState {
  String error;

  RegisterFailure(this.error);

}*/
