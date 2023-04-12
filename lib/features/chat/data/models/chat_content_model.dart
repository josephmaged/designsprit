import 'package:designsprit/features/chat/domain/entities/chat_content.dart';

class ChatContentModel extends ChatContent {
  const ChatContentModel(
      {required super.id,
       super.note,
      required super.type,
      required super.sentAt,
      super.audioDuration,
      super.mediaPath,
      required super.sender,
      required super.channelId});

  factory ChatContentModel.fromJson(Map<String, dynamic> json) => ChatContentModel(
        id: json["id"],
        note: json["note"],
        type: json["type"],
        sentAt: json["sentAt"],
        audioDuration: json["audioDuration"],
        mediaPath: json['mediaPath'],
        sender: json["sender"],
      channelId: json['channelId'],
      );
}
