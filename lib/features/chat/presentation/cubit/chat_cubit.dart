import 'dart:io';

import 'package:designsprit/features/chat/data/model/chat_response.dart';
import 'package:designsprit/features/chat/data/repositories/channel_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.repo) : super(ChatInitial());

  final ChannelRepo repo;

  static ChatCubit get(context) => BlocProvider.of(context);

  ChatResponse? response;

  Future<void> fetchChannels(int channelId) async {
    emit(ChatLoading());

    var result = await repo.getAllChat(channelId);
    result.fold((l) => emit(ChatFailure(l.errMessage)), (r) {
      response = r;
      emit(ChatSuccess(r));
    });
  }

  Future<void> sendTextMessage(
      File? file, int userId, String text, int userId2) async {
    emit(ChatSendMessageLoading());

    var result = await repo.sendMessage(file!, userId, text, userId2);

    result.fold((l) => emit(ChatSendMessageFailure()),
        (r) => emit(ChatSendMessageSuccess()));
  }
}
