import 'package:designsprit/features/auth/login/domain/entities/login_response.dart';
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

class LoginResponseModel extends LoginResponse {
  const LoginResponseModel({
    required super.id,
    required super.fuid,
    required super.name,
    required super.email,
    required super.phone,
     super.mobile,
     super.description,
     super.image,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
        id: json['id'],
        fuid: json['fuid'],
        name: json['userName'],
        email: json['userEmail'],
        phone: json['phone'],
        mobile: json['mobile'],
        description: json['description'],
        image: json['image'],
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
    return map;
  }
}
