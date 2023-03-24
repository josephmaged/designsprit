import 'package:designsprit/features/auth/register/domain/entities/registerDTO.dart';

/// Fuid : "123"
/// Name : "zarz"
/// Email : "zarzoor@gmail.com"
/// Phone : "0122222"
/// Mobile : "22"
/// Image : "image.jpg"

class RegisterDtoModel extends RegisterDTO {
  const RegisterDtoModel({
    required super.fuid,
    required super.name,
    required super.email,
    required super.phone,
    required super.mobile,
    required super.image,
  });

  factory RegisterDtoModel.fromJson(dynamic json) => RegisterDtoModel(
        fuid: json['fuid'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        mobile: json['mobile'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fuid'] = fuid;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['mobile'] = mobile;
    map['image'] = image;
    return map;
  }
}
