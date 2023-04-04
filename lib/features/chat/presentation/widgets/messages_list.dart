import 'package:design_spirit_admin/core/utils/cache_helper.dart';
import 'package:design_spirit_admin/core/utils/enum.dart';
import 'package:design_spirit_admin/features/chat/data/model/chat_response.dart';
import 'package:design_spirit_admin/features/chat/presentation/widgets/message_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MessagesList extends StatefulWidget {
  MessagesList({Key? key, required this.response}) : super(key: key);

  ChatResponse response;

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  // late final ScrollController _messagesScrollController;

  @override
  void initState() {
    print(widget.response.toJson());
    // _messagesScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // _messagesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SchedulerBinding.instance.addPostFrameCallback(
    //   (_) => _messagesScrollController.animateTo(
    //     _messagesScrollController.position.maxScrollExtent,
    //     duration: const Duration(milliseconds: 500),
    //     curve: Curves.linear,
    //   ),
    // );
    return ListView.builder(
      // controller: _messagesScrollController,
      itemCount: widget.response.data?.length ?? 0,
      itemBuilder: (context, index) {
        var message = widget.response.data?[index];

        final bool isSenderUser =
            message?.senderId == CacheHelper.getData(key: 'id');

        return MessageCard(
          isSender: isSenderUser,
          messageType: message?.type?.toEnum() ?? MessageType.text,
          time: DateFormat.Hm().format(DateTime.now()),
          swipeDirection:
              isSenderUser ? SwipeDirection.right : SwipeDirection.left,
          message: message?.note ?? "",
        );
      },
    );
  }
}
