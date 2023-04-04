import 'user.dart';

/// id : 1
/// createdAt : "2023-04-01T00:00:00"
/// userId : 3
/// user : {"id":3,"fuid":"nTOSY7INS4V49tteR5BNu3wcLGY2","userName":"Amir Nady","userEmail":"admin@gmail.com","phone":"01552929290","mobile":" ","description":" ","image":"c1314872-7ff2-4197-a4c4-c89dcce8c564.jpg"}
/// adminId : 3
/// admin : {"id":3,"fuid":"nTOSY7INS4V49tteR5BNu3wcLGY2","userName":"Amir Nady","userEmail":"admin@gmail.com","phone":"01552929290","mobile":" ","description":" ","image":"c1314872-7ff2-4197-a4c4-c89dcce8c564.jpg"}
/// notes : []

class ChannelResponseData {
  ChannelResponseData({
    int? id,
    String? createdAt,
    int? userId,
    User? user,
    int? adminId,
    User? admin,
  }) {
    _id = id;
    _createdAt = createdAt;
    _userId = userId;
    _user = user;
    _adminId = adminId;
    _admin = admin;
  }

  ChannelResponseData.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _userId = json['userId'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _adminId = json['adminId'];
    _admin = json['admin'] != null ? User.fromJson(json['admin']) : null;
  }

  int? _id;
  String? _createdAt;
  int? _userId;
  User? _user;
  int? _adminId;
  User? _admin;

  int? get id => _id;

  String? get createdAt => _createdAt;

  int? get userId => _userId;

  User? get user => _user;

  int? get adminId => _adminId;

  User? get admin => _admin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['userId'] = _userId;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['adminId'] = _adminId;
    if (_admin != null) {
      map['admin'] = _admin?.toJson();
    }
    return map;
  }
}
