import 'package:cached_network_image/cached_network_image.dart';
import 'package:design_spirit_admin/core/network/api_const.dart';
import 'package:design_spirit_admin/core/utils/app_router.dart';
import 'package:design_spirit_admin/core/widgets/place_holder.dart';
import 'package:design_spirit_admin/features/chat/data/model/channel_response_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactItemView extends StatelessWidget {
  ContactItemView({Key? key, required this.data}) : super(key: key);

  ChannelResponseData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kChatView, extra: data);
            },
            title: Text(data.user?.userName ?? ""),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                  height: 40,
                  width: 40,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => placeholderWidget(),
                  imageUrl: ApiConst.IMAGE_BATH),
            ),
          ),
        ],
      ),
    );
  }
}
