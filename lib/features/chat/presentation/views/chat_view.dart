import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ChatView extends StatefulWidget {
  ChatView({Key? key, required this.data}) : super(key: key);

  ChannelResponseData data;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  void initState() {
    ChatCubit.get(context).fetchChannels(widget.data.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(tittle: widget.data.user!.userName ?? ""),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Expanded(
                  child: MessagesList(
                      response:
                          ChatCubit.get(context).response ?? ChatResponse()),
                ),
                BottomChatTextField(
                  userId: widget.data.userId!,
                  isGroupChat: false,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BottomChatTextField extends StatefulWidget {
  const BottomChatTextField({
    Key? key,
    required this.userId,
    required this.isGroupChat,
  }) : super(key: key);

  final int userId;
  final bool isGroupChat;

  @override
  State<BottomChatTextField> createState() => _BottomChatTextFieldState();
}

class _BottomChatTextFieldState extends State<BottomChatTextField> {
  late final TextEditingController _messageController = TextEditingController();

  late final FlutterSoundRecorder _soundRecorder = FlutterSoundRecorder();

  late final FocusNode _tfFocusNode = FocusNode();

  bool _isSoundRecorderInitialized = false;

  bool _isAudioRecording = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // if (!isShowReplyMessage) const ReplyMessagePreview(),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(2, 2),
                      ),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          offset: const Offset(-2, -2),
                          blurRadius: 3,
                          spreadRadius: 1),
                    ],
                  ),
                  child: _buildChatTextField(),
                ),
              ),
              const SizedBox(width: 8),
              _buildMicOrSendButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMicOrSendButton() {
    return FloatingActionButton(
      onPressed: _messageController.text.isEmpty
          ? _recordAndSendAudio
          : _sendTextMessage,
      child: const Icon(
        // _messageController.text.isEmpty
        //     ? _isAudioRecording
        //         ? Icons.close
        //         : Icons.mic
        //     :
        Icons.send,
        color: Colors.white,
      ),
    );
  }

  Widget _buildChatTextField() {
    return TextField(
      minLines: 1,
      maxLines: 6,
      focusNode: _tfFocusNode,
      onChanged: (value) {
        setState(() {});
      },
      controller: _messageController,
      keyboardType: TextInputType.multiline,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: _buildSuffixTFIcon(),
        hintText: 'Type a message...',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white30,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        contentPadding: EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          left: 16.0,
          right: _messageController.text.isEmpty ? 0 : 16.0,
        ),
      ),
    );
  }

  Widget _buildSuffixTFIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          clipBehavior: Clip.antiAlias,
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Padding(
            padding: _messageController.text.isEmpty
                ? EdgeInsets.zero
                : const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) {
                return [
                  buildPopUpMenuItem(
                    Icons.video_collection_rounded,
                    'Send Video',
                    () => _pickAndSendVideo(context),
                  ),
                  buildPopUpMenuItem(
                    Icons.camera,
                    'Send Image',
                    () => _pickAndSendImage(context),
                  ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ),
        if (_messageController.text.isEmpty)
          buildMaterialIconButton(
            icon: Icons.camera,
            onTap: () => _pickAndSendImage(context),
          ),
      ],
    );
  }

  void _sendFile(File file, MessageType messageType) {
    ChatCubit.get(context).sendTextMessage(
      file,
      widget.userId,
      _messageController.text,
      widget.userId,
    );
    // ref.watch(chatControllerProvider).sendFileMessage(
    //   mounted,
    //   context,
    //   file: file,
    //   receiverUserId: widget.userId,
    //   messageType: messageType,
    //   groupId: widget.isGroupChat ? widget.userId : null,
    //   isGroupChat: widget.isGroupChat,
    // );
  }

  void _sendTextMessage() {
    ChatCubit.get(context).sendTextMessage(
      null,
      widget.userId,
      _messageController.text,
      widget.userId,
    );
  }

  void _pickAndSendImage(BuildContext context) async {
    File? imageFile = await pickImageFromGallery(context);
    if (imageFile != null) {
      _sendFile(imageFile, MessageType.image);
    }

    if (_messageController.text.isNotEmpty) {
      if (!mounted) return;
      Navigator.pop(context);
    }
  }

  void _pickAndSendVideo(BuildContext context) async {
    File? videoFile = await pickVideoFromGallery(context);
    if (videoFile != null) {
      _sendFile(videoFile, MessageType.video);
    }
    if (!mounted) return;
    Navigator.pop(context);
  }

  void _recordAndSendAudio() async {
    if (!_isSoundRecorderInitialized) return;
    final Directory tempDirectory = await getTemporaryDirectory();
    String audioFilePath = '${tempDirectory.path}${''}';

    if (!_isAudioRecording) {
      _soundRecorder.startRecorder(toFile: audioFilePath);
    } else {
      _soundRecorder.stopRecorder();
      _sendFile(File(audioFilePath), MessageType.audio);
    }

    setState(() => _isAudioRecording = !_isAudioRecording);
  }

  PopupMenuItem buildPopUpMenuItem(
    IconData icon,
    String text,
    VoidCallback onPressed,
  ) {
    return PopupMenuItem(
      child: ListTile(
        leading: Icon(icon),
        title: Text(text),
        onTap: onPressed,
      ),
    );
  }

  Widget buildMaterialIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: IconButton(
        onPressed: onTap,
        splashColor: Colors.grey,
        icon: Icon(
          icon,
          color: Colors.white30,
        ),
      ),
    );
  }
}

Future<File?> pickVideoFromGallery(BuildContext context) async {
  File? videoFile;

  try {
    XFile? xFile = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(minutes: 1),
    );

    if (xFile != null) {
      videoFile = File(xFile.path);
    }
  } catch (e) {
    // showSnackBar(context, content: e.toString());
  }

  return videoFile;
}

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? imageFile;

  try {
    XFile? xFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (xFile != null) {
      imageFile = File(xFile.path);
    }
  } catch (e) {
    // showSnackBar(context, content: e.toString());
  }

  return imageFile;
}
