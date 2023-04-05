import 'dart:io';

import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/api_response.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/chat/domain/entities/chat_content.dart';
import 'package:designsprit/features/chat/domain/entities/send_message.dart';
import 'package:designsprit/features/chat/domain/use_cases/get_chat_usecase.dart';
import 'package:designsprit/features/chat/domain/use_cases/send_message_usecase.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatContentUseCase getChatContentUseCase;
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit(this.getChatContentUseCase, this.sendMessageUseCase) : super(const ChatState());

  static ChatCubit get(context) => BlocProvider.of(context);
  final TextEditingController messageController = TextEditingController();
  MultipartFile? imageFile;
  File? imageUi;

  Future<void> getChat() async {
    String fUid = CacheHelper.getData(key: Constants.fID);
    print(fUid);
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

  Future<void> sendMessage(
    MessageType type,
  ) async {
    int uid = CacheHelper.getData(key: Constants.userID);
    int? channel;
    try {
      if (state.requestResponse != null || state.requestResponse!.isNotEmpty) {
        channel = state.requestResponse?[0].channelId;
      }
    } catch (e) {}

    final result = await sendMessageUseCase(SendMessage(
      senderId: uid,
      note: type == MessageType.text ? messageController.text : null,
      type: type.type,
      audioDuration: 0,
      channelId: channel,
      mediaPath: imageFile,
    ));

    result.fold(
      (l) {
        emit(state.copyWith(
          requestState: RequestState.error,
          requestMessage: l.errMessage,
        ));
      },
      (r) {
        emit(state.copyWith(
          apiResponse: r,
          requestState: RequestState.loaded,
        ));
        getChat();
      },
    );
  }

  Future<void> pickImage() async {
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
    sendMessage(MessageType.image);
  }

  Future<void> pickVideo() async {
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
    sendMessage(MessageType.video);
  }
}
