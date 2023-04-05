part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ChatContent>? requestResponse;
  final List<ApiResponse>? apiResponse;
  final RequestState? requestState;
  final String? requestMessage;
  final MultipartFile? imageFile;
  final File? imageUi;
  final MessageType? type;

  const ChatState(
      {this.type,
      this.apiResponse,
      this.requestResponse,
      this.requestState,
      this.requestMessage,
      this.imageFile,
      this.imageUi});

  ChatState copyWith({
    List<ChatContent>? requestResponse,
    List<ApiResponse>? apiResponse,
    RequestState? requestState,
    String? requestMessage,
    MultipartFile? imageFile,
    File? imageUi,
    MessageType? type,
  }) {
    return ChatState(
      requestResponse: requestResponse ?? this.requestResponse,
      apiResponse: apiResponse ?? this.apiResponse,
      requestState: requestState ?? this.requestState,
      requestMessage: requestMessage ?? this.requestMessage,
      imageFile: imageFile ?? this.imageFile,
      imageUi: imageUi ?? this.imageUi,
      type: type ?? this.type,
    );
  }

  @override
  List<Object?> get props => [
        requestResponse,
        requestState,
        apiResponse,
        requestMessage,
        imageFile,
        imageUi,
        type,
      ];
}
