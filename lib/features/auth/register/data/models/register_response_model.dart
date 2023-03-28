import 'package:designsprit/features/auth/register/domain/entities/register_response.dart';

/// id : 1
/// fuid : "xQFkcha5oCh0gv9I6elwnehBqFs1"
/// name : "zarz"
/// email : "zarzoor@gmail.com"
/// phone : "0122222"
/// mobile : "22"
/// description : null
/// image : "image.jpg"
/// status : false
/// rule : null

class RegisterResponseModel extends RegisterResponse {
  const RegisterResponseModel({
    required super.id,
    required super.fuid,
    required super.name,
    required super.email,
    required super.phone,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        id: json['id'],
        fuid: json['fuid'],
        name: json['userName'],
        email: json['userEmail'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fuid'] = fuid;
    map['userName'] = name;
    map['userEmail'] = email;
    map['phone'] = phone;
    return map;
  }
}
