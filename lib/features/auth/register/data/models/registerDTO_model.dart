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
        fuid: json['Fuid'],
        name: json['Name'],
        email: json['Email'],
        phone: json['Phone'],
        mobile: json['Mobile'],
        image: json['Image'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Fuid'] = fuid;
    map['Name'] = name;
    map['Email'] = email;
    map['Phone'] = phone;
    map['Mobile'] = mobile;
    map['Image'] = image;
    return map;
  }
}
