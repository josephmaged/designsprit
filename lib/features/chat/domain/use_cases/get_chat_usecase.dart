import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/usecase/base_usecase.dart';
import 'package:designsprit/features/chat/domain/entities/chat_content.dart';
import 'package:designsprit/features/chat/domain/repositories/base_chat_repo.dart';
import 'package:equatable/equatable.dart';

class GetChatContentUseCase extends BaseUseCase<List<ChatContent>, ChatContentParameters> {
  final BaseChatRepo baseChatRepo;

  GetChatContentUseCase(this.baseChatRepo);

  @override
  Future<Either<Failure, List<ChatContent>>> call(parameters) async {
    return await baseChatRepo.getChatContent(parameters);
  }
}

class ChatContentParameters extends Equatable {
  final String fUid;

  const ChatContentParameters({required this.fUid});

  @override
  List<Object> get props => [fUid];
}
