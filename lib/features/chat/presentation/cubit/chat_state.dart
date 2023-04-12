part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ChatContent>? requestResponse;
  final List<ApiResponse>? apiResponse;
  final RequestState? requestState;
  final String? requestMessage;
  final MultipartFile? file;
  final MessageType? type;

  const ChatState(
      {this.type,
      this.apiResponse,
      this.requestResponse,
      this.requestState,
      this.requestMessage,
      this.file});

  ChatState copyWith({
    List<ChatContent>? requestResponse,
    List<ApiResponse>? apiResponse,
    RequestState? requestState,
    String? requestMessage,
    MultipartFile? file,
    MessageType? type,
  }) {
    return ChatState(
      requestResponse: requestResponse ?? this.requestResponse,
      apiResponse: apiResponse ?? this.apiResponse,
      requestState: requestState ?? this.requestState,
      requestMessage: requestMessage ?? this.requestMessage,
      file: file ?? this.file,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [
        requestResponse,
        requestState,
        apiResponse,
        requestMessage,
        file,
        type,
      ];
}
