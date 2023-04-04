import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:designsprit/core/errors/failures.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/features/chat/data/model/chat_response.dart';
import 'package:designsprit/features/chat/data/repositories/channel_repo.dart';
import 'package:dio/dio.dart';

class ChannelRepoImpl extends ChannelRepo {
  ChannelRepoImpl();


  @override
  Future<Either<Failure, ChatResponse>> getAllChat(int channelId) async {
    try {
      print(channelId);
      var data =
          await Dio().get(endPoint: ApiConst.getAllChat, parameters: {
        "channelId": channelId,
      });

      var result = ChatResponse.fromJson(data);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ChatResponse>> sendMessage(
      File file, int userId, String text, int userId2) async {
    try {
      var data = await apiService.get(endPoint: ApiConst.getAllChat);

      var result = ChatResponse.fromJson(data);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
