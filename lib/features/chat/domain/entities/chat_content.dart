import 'package:equatable/equatable.dart';

class ChatContent extends Equatable {
  final int id;
  final String? note;
  final int type;
  final String sentAt;
  final double? audioDuration;
  final String? mediaPath;
  final String? sender;
  final int? channelId;

  const ChatContent({
    required this.id,
     this.note,
    required this.type,
    required this.sentAt,
    this.audioDuration,
    this.mediaPath,
    required this.sender,
     this.channelId  ,
  });

  @override
  List<Object?> get props => [
        id,
        note,
        type,
        sentAt,
        audioDuration,
        mediaPath,
        sender,
        channelId,
      ];
}
