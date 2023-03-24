import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/core/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomListTile(
          text: AppStrings.myProfile,
          leadingIcon: const Icon(Icons.person),
          trailingIcon: Icons.arrow_forward_ios,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kProfileView);
          },
        ),
        CustomListTile(
          text: AppStrings.projectStatus,
          leadingIcon: const Icon(Icons.preview),
          trailingIcon: Icons.arrow_forward_ios,
          onTap: () {
            GoRouter.of(context).push(AppRouter.kTimelineView);
          },
        ),
        CustomListTile(
          text: AppStrings.contactUs,
          leadingIcon: const Icon(Icons.contact_page),
          trailingIcon: Icons.arrow_forward_ios,
          onTap: () {
            //GoRouter.of(context).push(AppRouter.kContactUs);
          },
        ),
        CustomListTile(
          text: AppStrings.inviteYourFriends,
          leadingIcon: const Icon(Icons.share),
          trailingIcon: Icons.arrow_forward_ios,
          onTap: () {
            Share.share("test");
          },
        ),
        CustomListTile(
          text: AppStrings.logout,
          leadingIcon: const Icon(Icons.logout),
          trailingIcon: Icons.arrow_forward_ios,
          onTap: () {
            //GoRouter.of(context).push(AppRouter.kContactUs);
          },
        ),
      ],
    );
  }
}

