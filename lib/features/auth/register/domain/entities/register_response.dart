import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  final num id;
  final String fuid;
  final String name;
  final String email;
  final String phone;

  const RegisterResponse(
      {required this.id,
      required this.fuid,
      required this.name,
      required this.email,
      required this.phone,});

  @override
  List<Object?> get props => [
        id,
        fuid,
        name,
        email,
        phone,
      ];
}
