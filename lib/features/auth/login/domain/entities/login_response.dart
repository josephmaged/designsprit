import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final num id;
  final String fuid;
  final String name;
  final String email;
  final String phone;
  final String? mobile;
  final String? description;
  final String? image;

  const LoginResponse({
    required this.id,
    required this.fuid,
    required this.name,
    required this.email,
    required this.phone,
    this.mobile,
    this.description,
    this.image,
  });

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
      ];
}
