import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/chat/domain/entities/send_message.dart';
import 'package:designsprit/features/chat/domain/repositories/base_chat_repo.dart';

class SendMessageUseCase extends BaseUseCase<List<ApiResponse>, SendMessage> {
  final BaseChatRepo baseChatRepo;

  SendMessageUseCase(this.baseChatRepo);

  @override
  Future<Either<Failure, List<ApiResponse>>> call(SendMessage parameters) async {
    return await baseChatRepo.sendMessage(parameters);
  }
}
