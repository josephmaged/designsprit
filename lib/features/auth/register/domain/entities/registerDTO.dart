import 'package:equatable/equatable.dart';

class RegisterDTO extends Equatable {
  final String fuid;
  final String name;
  final String email;
  final String phone;
  final String mobile;
  final String image;

  const RegisterDTO({
    required this.fuid,
    required this.name,
    required this.email,
    required this.phone,
    required this.mobile,
    required this.image,
  });

  @override
  List<Object> get props => [
        fuid,
        name,
        email,
        phone,
        mobile,
        image,
      ];
}
