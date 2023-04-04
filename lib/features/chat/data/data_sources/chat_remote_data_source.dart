import 'package:designsprit/core/errors/exceptions.dart';
import 'package:designsprit/core/network/api_const.dart';
import 'package:designsprit/core/network/error_message_model.dart';
import 'package:designsprit/features/chat/data/models/chat_content_model.dart';
import 'package:designsprit/features/chat/domain/use_cases/get_chat_usecase.dart';
import 'package:dio/dio.dart';

abstract class BaseChatRemoteDataSource {
  Future<List<ChatContentModel>> getChatContent(ChatContentParameters parameters);
}

class ChatDataSource extends BaseChatRemoteDataSource {
  @override
  Future<List<ChatContentModel>> getChatContent(ChatContentParameters parameters) async{
    final response = await Dio().post(
      ApiConst.getChat(parameters.fUid),
    );

    if (response.statusCode == 200) {
      if (response.data.containsKey('data')) {
        final data = response.data['data'];
        if (data is List) {
          return data.map((e) => ChatContentModel.fromJson(e)).toList();
        } else if (data is Map<String, dynamic>) {
          return [ChatContentModel.fromJson(data)];
        }
      }
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}
