import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final num id;
  final String fuid;
  final String name;
  final String email;
  final String phone;
  final String mobile;
  final dynamic description;
  final String image;
  final bool status;
  final dynamic rule;

  const LoginResponse(
      {required this.id,
      required this.fuid,
      required this.name,
      required this.email,
      required this.phone,
      required this.mobile,
      required this.description,
      required this.image,
      required this.status,
      required this.rule});

  @override
  List<Object?> get props => [
        id,
        fuid,
        name,
        email,
        phone,
        mobile,
        description,
        image,
        status,
        rule,
      ];
}
