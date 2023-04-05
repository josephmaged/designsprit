import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/chat/domain/entities/chat_content.dart';
import 'package:designsprit/features/chat/domain/entities/send_message.dart';
import 'package:designsprit/features/chat/domain/use_cases/get_chat_usecase.dart';

abstract class BaseChatRepo {
  Future<Either<Failure, List<ChatContent>>> getChatContent(ChatContentParameters parameters);

  Future<Either<Failure, List<ApiResponse>>> sendMessage(SendMessage parameters);
}
