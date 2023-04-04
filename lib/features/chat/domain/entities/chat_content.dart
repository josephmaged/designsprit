import 'package:equatable/equatable.dart';

class ChatContent extends Equatable {
  final int id;
  final String note;
  final int type;
  final String sentAt;
  final double? audioDuration;
  final String? mediaPath;
  final String sender;

  const ChatContent({
    required this.id,
    required this.note,
    required this.type,
    required this.sentAt,
    this.audioDuration,
    this.mediaPath,
    required this.sender,
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
      ];
}
