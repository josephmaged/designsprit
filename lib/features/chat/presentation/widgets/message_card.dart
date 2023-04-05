import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/chat/presentation/widgets/display_message.dart';
import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    Key? key,
    required this.isSender,
    required this.message,
    required this.time,
    required this.messageType,
    required this.swipeDirection,
  }) : super(key: key);

  final bool isSender;
  final String message;
  final String time;
  final MessageType messageType;
  final SwipeDirection swipeDirection;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
          minWidth: 0.0,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 4.0,
          ),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isSender ? kPrimaryColor : kSecondaryColor,
            borderRadius: BorderRadius.only(
              topLeft: isSender ? const Radius.circular(12.0) : Radius.zero,
              topRight: const Radius.circular(12.0),
              bottomLeft: const Radius.circular(12.0),
              bottomRight: isSender ? Radius.zero : const Radius.circular(12.0),
            ),
          ),
          child: _buildMessageContent(context, false, isSender),
        ),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context, bool isReplying, bool isSender) {
    bool isSeen = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isReplying) ...[
          Text(
            'username',
            style: isSender
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.black),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: DisplayMessage(
              isSender: isSender,
              message: 'repliedText',
              messageType: messageType,
            ),
          ),
        ],
        const SizedBox(height: 8),
        DisplayMessage(
          message: message,
          isSender: isSender,
          messageType: messageType,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isSender ? Colors.white : Colors.grey,
                  ),
            ),
            const SizedBox(width: 4),
            isSender
                ? Icon(
                    Icons.done,
                    color: isSeen ? Colors.black.withOpacity(0.3) : Colors.white10,
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
