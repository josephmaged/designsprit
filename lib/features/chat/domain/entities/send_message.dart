import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class SendMessage extends Equatable {
  final int? senderId;
  final String? note;
  final MultipartFile? mediaPath;
  final int? type;
  final int? audioDuration;
  final int? channelId;

  const SendMessage({
    this.senderId,
    this.note,
    this.mediaPath,
    this.type,
    this.audioDuration,
    this.channelId,
  });

  @override
  List<Object?> get props => [senderId, note, mediaPath, type, audioDuration, channelId];
}
