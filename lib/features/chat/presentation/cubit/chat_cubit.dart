import 'dart:io';

import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/chat/domain/entities/chat_content.dart';
import 'package:designsprit/features/chat/domain/use_cases/get_chat_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatContentUseCase getChatContentUseCase;

  ChatCubit(this.getChatContentUseCase) : super(const ChatState());

  static ChatCubit get(context) => BlocProvider.of(context);
  final TextEditingController messageController = TextEditingController();
  MultipartFile? imageFile;
  File? imageUi;

  Future<void> getChat() async {
    String fUid = CacheHelper.getData(key: Constants.fID);
    final result = await getChatContentUseCase(ChatContentParameters(fUid: fUid));
    result.fold(
      (l) {
        emit(
          state.copyWith(
            requestMessage: l.errMessage,
            requestState: RequestState.error,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            requestState: RequestState.loaded,
            requestResponse: r,
          ),
        );
      },
    );
  }

  Future<void> sendMessage(MessageType type, int senderId, int channelId) async {

   /* var result = await repo.sendMessage(
      ChatParameter(
        channelId: channelId,
        note: type == MessageType.text ? messageController.text : null,
        mediaPath: imageFile,
        senderId: senderId,
        type: type.type,
      ),
    );

    result.fold(
      (l) => emit(ChatSendMessageFailure()),
      (r) {
        messageController.text = '';
        emit(ChatSendMessageSuccess());
      },
    );*/
  }

  Future<void> pickImage(int senderId, int channelId) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = await MultipartFile.fromFile(pickedFile.path);
      if (file.isFinalized) {
      } else {
        imageFile = file;
        imageUi = File(pickedFile.path);
      }
    }
    emit(state.copyWith(
      imageFile: imageFile,
      imageUi: imageUi,
    ));
    sendMessage(MessageType.image, senderId, channelId);
  }

  Future<void> pickVideo(int senderId, int channelId) async {
    XFile? pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = await MultipartFile.fromFile(pickedFile.path);
      if (file.isFinalized) {
      } else {
        imageFile = file;
        imageUi = File(pickedFile.path);
      }
    }
    emit(state.copyWith(
      imageFile: imageFile,
      imageUi: imageUi,
    ));
    sendMessage(MessageType.video, senderId, channelId);
  }
}
