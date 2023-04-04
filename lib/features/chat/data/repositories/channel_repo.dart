import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/features/chat/data/model/chat_response.dart';

abstract class ChannelRepo {

  Future<Either<Failure, ChatResponse>> getAllChat(int channelId);
  Future<Either<Failure, ChatResponse>> sendMessage(File file, int userId, String text, int userId2);
}
