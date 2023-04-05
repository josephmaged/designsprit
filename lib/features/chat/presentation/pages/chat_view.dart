import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_app_bar.dart';
import 'package:designsprit/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:designsprit/features/chat/presentation/widgets/messages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int userId = CacheHelper.getData(key: Constants.userID);
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(titleName: AppStrings.chat),
          body: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  children: const [
                    Expanded(
                      child: MessagesList(),
                    ),
                    BottomChatTextField(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class BottomChatTextField extends StatefulWidget {
  const BottomChatTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomChatTextField> createState() => _BottomChatTextFieldState();
}

class _BottomChatTextFieldState extends State<BottomChatTextField> {
  late final FocusNode _tfFocusNode = FocusNode();

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
                          color: Colors.grey.shade200, offset: const Offset(-2, -2), blurRadius: 3, spreadRadius: 1),
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
    return InkWell(
      onTap: _sendTextMessage,
      child: Container(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: kPrimaryColor),
        child: const Icon(
          Icons.send,
          color: Colors.white,
        ),
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
      controller: ChatCubit.get(context).messageController,
      keyboardType: TextInputType.multiline,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey,
        suffixIconConstraints: const BoxConstraints(),
        suffixIcon: _buildSuffixTFIcon(),
        hintText: 'Type a message...',
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white54,
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
          right: ChatCubit.get(context).messageController.text.isEmpty ? 0 : 16.0,
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
            padding: ChatCubit.get(context).messageController.text.isEmpty
                ? EdgeInsets.zero
                : const EdgeInsets.only(right: 16.0),
            child: PopupMenuButton(
              padding: EdgeInsets.zero,
              itemBuilder: (context) {
                return [
                  buildPopUpMenuItem(
                    Icons.video_collection_rounded,
                    'Send Video',
                    () => ChatCubit.get(context).pickVideo(),
                  ),
                  buildPopUpMenuItem(
                    Icons.camera,
                    'Send Image',
                    () => ChatCubit.get(context).pickImage(),
                  ),
                ];
              },
              child: const Icon(Icons.more_vert),
            ),
          ),
        ),
        const SizedBox(width: 20)
      ],
    );
  }

  void _sendTextMessage() {
    ChatCubit.get(context).sendMessage(
      MessageType.text,
    );
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
