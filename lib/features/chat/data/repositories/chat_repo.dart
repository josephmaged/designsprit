import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:designsprit/features/chat/domain/entities/chat_content.dart';
import 'package:designsprit/features/chat/domain/entities/send_message.dart';
import 'package:designsprit/features/chat/domain/repositories/base_chat_repo.dart';
import 'package:designsprit/features/chat/domain/use_cases/get_chat_usecase.dart';

class ChatRepo extends BaseChatRepo {
  final BaseChatRemoteDataSource baseChatRemoteDataSource;

  ChatRepo(this.baseChatRemoteDataSource);

  @override
  Future<Either<Failure, List<ChatContent>>> getChatContent(ChatContentParameters parameters) async {
    try {
      final result = await baseChatRemoteDataSource.getChatContent(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ApiResponse>>> sendMessage(SendMessage parameters) async {
    try {
      final result = await baseChatRemoteDataSource.sendMessage(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
