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
    required super.mobile,
    required super.description,
    required super.image,
    required super.status,
    required super.rule,
  });

  factory RegisterResponseModel.fromJson(dynamic json) => RegisterResponseModel(
        id: json['id'],
        fuid: json['fuid'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        mobile: json['mobile'],
        description: json['description'],
        image: json['image'],
        status: json['status'],
        rule: json['rule'],
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['fuid'] = fuid;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['mobile'] = mobile;
    map['description'] = description;
    map['image'] = image;
    map['status'] = status;
    map['rule'] = rule;
    return map;
  }
}
