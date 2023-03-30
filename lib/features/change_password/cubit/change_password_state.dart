part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  final bool? isPassword;

  const ChangePasswordState({
    this.isPassword,
  });

  ChangePasswordState copyWith({
    bool? isPassword,
  }) {
    return ChangePasswordState(
      isPassword: isPassword ?? this.isPassword,
    );
  }

  @override
  List<Object?> get props => [isPassword];
}
