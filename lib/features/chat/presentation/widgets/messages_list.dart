import 'package:designsprit/constants.dart';
import 'package:designsprit/core/utils/assets.dart';
import 'package:designsprit/core/utils/cache_helper.dart';
import 'package:designsprit/core/utils/enum.dart';
import 'package:designsprit/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:designsprit/features/chat/presentation/widgets/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessagesList extends StatefulWidget {
  MessagesList({
    Key? key,
  }) : super(key: key);

  @override
  State<MessagesList> createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return state.requestResponse == null
            ? Center(
                child: Image.asset(
                  AssetsData.notFound,
                  height: 250.h,
                ),
              )
            : ListView.builder(
                reverse: true,
                itemCount: state.requestResponse!.length ?? 0,
                itemBuilder: (context, index) {
                  var message = state.requestResponse![index];

                  final bool isSenderUser =
                      state.requestResponse![index].sender == CacheHelper.getData(key: Constants.userName);
                  var userId = CacheHelper.getData(key: Constants.userName);

                  return MessageCard(
                    isSender: isSenderUser,
                    messageType: message.type.toEnum() ?? MessageType.text,
                    time: DateFormat.Hm().format(DateTime.now()),
                    swipeDirection: isSenderUser ? SwipeDirection.right : SwipeDirection.left,
                    message: message.note ?? "",
                  );
                },
              );
      },
    );
  }
}
