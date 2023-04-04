import 'channel_response_data.dart';

/// success : true
/// message : "success"
/// data : [{"id":1,"createdAt":"2023-04-01T00:00:00","userId":3,"user":{"id":3,"fuid":"nTOSY7INS4V49tteR5BNu3wcLGY2","userName":"Amir Nady","userEmail":"admin@gmail.com","phone":"01552929290","mobile":" ","description":" ","image":"c1314872-7ff2-4197-a4c4-c89dcce8c564.jpg"},"adminId":3,"admin":{"id":3,"fuid":"nTOSY7INS4V49tteR5BNu3wcLGY2","userName":"Amir Nady","userEmail":"admin@gmail.com","phone":"01552929290","mobile":" ","description":" ","image":"c1314872-7ff2-4197-a4c4-c89dcce8c564.jpg"},"notes":[]}]
/// totalRecords : null

class ChannelResponse {
  ChannelResponse({
    bool? success,
    String? message,
    List<ChannelResponseData>? data,
    dynamic totalRecords,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _totalRecords = totalRecords;
  }

  ChannelResponse.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ChannelResponseData.fromJson(v));
      });
    }
    _totalRecords = json['totalRecords'];
  }

  bool? _success;
  String? _message;
  List<ChannelResponseData>? _data;
  dynamic _totalRecords;

  bool? get success => _success;

  String? get message => _message;

  List<ChannelResponseData>? get data => _data;

  dynamic get totalRecords => _totalRecords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['totalRecords'] = _totalRecords;
    return map;
  }
}
