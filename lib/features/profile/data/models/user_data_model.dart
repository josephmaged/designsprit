import 'package:designsprit/features/profile/domain/entities/user_data.dart';

class UserDataModel extends UserData {
  const UserDataModel({
    super.id,
    super.fuid,
    super.userName,
    super.userEmail,
    super.phone,
    super.mobile,
    super.source,
    super.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json['id'],
        fuid: json['fuid'],
        userName: json['userName'],
        userEmail: json['userEmail'],
        phone: json['phone'],
        mobile: json['mobile'],
        source: json['KnownFrom'],
        image: json['image'],
      );
}
