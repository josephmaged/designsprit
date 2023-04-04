/// id : 3
/// fuid : "nTOSY7INS4V49tteR5BNu3wcLGY2"
/// userName : "Amir Nady"
/// userEmail : "admin@gmail.com"
/// phone : "01552929290"
/// mobile : " "
/// description : " "
/// image : "c1314872-7ff2-4197-a4c4-c89dcce8c564.jpg"

class User {
  User({
    num? id,
    String? fuid,
    String? userName,
    String? userEmail,
    String? phone,
    String? mobile,
    String? description,
    String? image,
  }) {
    _id = id;
    _fuid = fuid;
    _userName = userName;
    _userEmail = userEmail;
    _phone = phone;
    _mobile = mobile;
    _description = description;
    _image = image;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _fuid = json['fuid'];
    _userName = json['userName'];
    _userEmail = json['userEmail'];
    _phone = json['phone'];
    _mobile = json['mobile'];
    _description = json['description'];
    _image = json['image'];
  }

  num? _id;
  String? _fuid;
  String? _userName;
  String? _userEmail;
  String? _phone;
  String? _mobile;
  String? _description;
  String? _image;

  num? get id => _id;

  String? get fuid => _fuid;

  String? get userName => _userName;

  String? get userEmail => _userEmail;

  String? get phone => _phone;

  String? get mobile => _mobile;

  String? get description => _description;

  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['fuid'] = _fuid;
    map['userName'] = _userName;
    map['userEmail'] = _userEmail;
    map['phone'] = _phone;
    map['mobile'] = _mobile;
    map['description'] = _description;
    map['image'] = _image;
    return map;
  }
}
