

import 'package:designsprit/features/chat/data/model/user.dart';

/// id : 3
/// note : "sfsdfdfdsf"
/// type : 0
/// sentAt : "2023-04-04T00:00:00"
/// audioDuration : 1.0
/// channelId : 1
/// channel : null
/// senderId : 2
/// sender : {"id":2,"fuid":"VWj8dVsuvzfcfJ1y97Bu3Jxs7du1","userName":"Bishoy","userEmail":"bishoyshnouda@gmail.com","phone":"01271105357","mobile":"02236597278","description":"this is good","image":"c1314872-7ff2-4197-a4c4-c89dcce8c564.jpg","isActive":true,"knownFrom":"linkedin","lastLogin":null,"parentId":null,"ruleId":2,"fcmToken":"new token","accessPrivileges":[],"adminAssignStepAdmins":[],"adminAssignStepUsers":[],"inverseParent":[],"notifications":[],"parent":null,"paymentInstallments":[],"projectSteps":[],"projectTracks":[],"projects":[],"requests":[],"rule":null,"userLikeds":[],"userLogs":[]}

class ChatResponseData {
  ChatResponseData({
    int? id,
    String? note,
    int? type,
    String? sentAt,
    double? audioDuration,
    int? channelId,
    dynamic channel,
    int? senderId,
    User? sender,
  }) {
    _id = id;
    _note = note;
    _type = type;
    _sentAt = sentAt;
    _audioDuration = audioDuration;
    _channelId = channelId;
    _channel = channel;
    _senderId = senderId;
    _sender = sender;
  }

  ChatResponseData.fromJson(dynamic json) {
    _id = json['id'];
    _note = json['note'];
    _type = json['type'];
    _sentAt = json['sentAt'];
    _audioDuration = json['audioDuration'];
    _channelId = json['channelId'];
    _channel = json['channel'];
    _senderId = json['senderId'];
    _sender = json['sender'] != null ? User.fromJson(json['sender']) : null;
  }

  int? _id;
  String? _note;
  int? _type;
  String? _sentAt;
  double? _audioDuration;
  int? _channelId;
  dynamic _channel;
  int? _senderId;
  User? _sender;

  int? get id => _id;

  String? get note => _note;

  int? get type => _type;

  String? get sentAt => _sentAt;

  double? get audioDuration => _audioDuration;

  int? get channelId => _channelId;

  dynamic get channel => _channel;

  int? get senderId => _senderId;

  User? get sender => _sender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['note'] = _note;
    map['type'] = _type;
    map['sentAt'] = _sentAt;
    map['audioDuration'] = _audioDuration;
    map['channelId'] = _channelId;
    map['channel'] = _channel;
    map['senderId'] = _senderId;
    if (_sender != null) {
      map['sender'] = _sender?.toJson();
    }
    return map;
  }
}
