part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final RegisterResponse? registerResponse;
  final RequestState? requestState;
  final String? registerMessage;

  const RegisterState({
    this.registerResponse,
    this.requestState,
    this.registerMessage,
  });

  RegisterState copyWith({
    RegisterResponse? registerResponse,
    RequestState? requestState,
    String? registerMessage,
  }) {
    return RegisterState(
      registerResponse: registerResponse ?? this.registerResponse,
      requestState: requestState ?? this.requestState,
      registerMessage: registerMessage ?? this.registerMessage,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
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
