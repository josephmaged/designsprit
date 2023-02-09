part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final RegisterResponse? registerResponse;
  final RequestState? requestState;
  final String? registerMessage;
  final UserCredential? userCredential;

  const RegisterState({
    this.registerResponse,
    this.requestState,
    this.registerMessage,
    this.userCredential
  });

  RegisterState copyWith({
    RegisterResponse? registerResponse,
    RequestState? requestState,
    String? registerMessage,
    UserCredential? userCredential,
  }) {
    return RegisterState(
      registerResponse: registerResponse ?? this.registerResponse,
      requestState: requestState ?? this.requestState,
      registerMessage: registerMessage ?? this.registerMessage,
      userCredential: userCredential ?? this.userCredential,
    );
  }

  @override
  List<Object?> get props => [
    registerResponse,
    requestState,
    registerMessage,
    userCredential,
  ];
}

class RegisterChangePasswordVisibilityState extends RegisterState {}

class RegisterChangeRememberMeState extends RegisterState {}

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
