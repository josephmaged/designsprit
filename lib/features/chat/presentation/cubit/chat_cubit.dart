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
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GetChatContentUseCase getChatContentUseCase;
  final SendMessageUseCase sendMessageUseCase;

  ChatCubit(this.getChatContentUseCase, this.sendMessageUseCase) : super(const ChatState());

  static ChatCubit get(context) => BlocProvider.of(context);
  final TextEditingController messageController = TextEditingController();
  MultipartFile? pickedFile;

  Future<void> getChat() async {
    String fUid = CacheHelper.getData(key: Constants.fID);
    print(fUid);

    messageController.text = '';
    pickedFile = null;

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
            requestResponse: r.reversed.toList(),
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
      mediaPath: pickedFile,
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

        messageController.text = '';
        pickedFile = null;
      },
    );

    getChat();
  }

  Future<void> pickFile(PlatformFile file) async {
    pickedFile = await MultipartFile.fromFile(file.path!);
    emit(state.copyWith(file: pickedFile));
    sendMessage(MessageType.document);
  }

  Future<void> pickImage(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    pickedFile = await MultipartFile.fromFile(newFile.path);
    emit(state.copyWith(file: pickedFile));
    sendMessage(MessageType.image);
  }

  Future<void> pickVideo(PlatformFile file) async {
    pickedFile = await MultipartFile.fromFile(file.path!);
    emit(state.copyWith(file: pickedFile));
    sendMessage(MessageType.video);
  }

/*  Future<void> pickImage() async {
    XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = await MultipartFile.fromFile(pickedFile.path);
      if (file.isFinalized) {
      } else {
        imageFile = file;
      }
    }
    emit(state.copyWith(
      imageFile: imageFile,
    ));

    sendMessage(MessageType.image);
  }*/

/* Future<void> pickVideo() async {
    XFile? pickedFile = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = await File.fromFile(pickedFile.path);
      if (file.isFinalized) {
      } else {

        emit(state.copyWith(
          file: file,
        ));
      }
    }
    sendMessage(MessageType.video);
  }*/
}
