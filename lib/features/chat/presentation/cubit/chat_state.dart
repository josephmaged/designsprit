part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatFailure extends ChatState {
  final String errMessage;

  ChatFailure(this.errMessage);
}

class ChatSuccess extends ChatState {
  final ChatResponse response;

  ChatSuccess(this.response);
}



class ChatSendMessageLoading extends ChatState{}
class ChatSendMessageSuccess extends ChatState{}
class ChatSendMessageFailure extends ChatState{}

class ChatSendVideo extends ChatState{}