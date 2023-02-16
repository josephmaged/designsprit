import 'package:designsprit/core/utils/app_router.dart';
import 'package:designsprit/core/utils/strings.dart';
import 'package:designsprit/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text(
            AppStrings.myProfile,
          ),
          leading: const Icon(Icons.person),
          trailing: SvgPicture.asset(
            Assets.imagesSettingsRightArrowIc,
          ),
          onTap: () {
           // Navigator.pushNamed(context, AppRouter.profileRoute);
          },
        ),
        ListTile(
          title: const Text(AppStrings.projectStatus),
          leading: const Icon(Icons.preview),
          trailing: SvgPicture.asset(
            Assets.imagesSettingsRightArrowIc,
          ),
          onTap: () {
            //Navigator.pushNamed(context, AppRouter.timelineRoute);
          },
        ),
        ListTile(
          title: const Text(
            AppStrings.changeLanguage,
          ),
          leading: const Icon(Icons.person),
          trailing: SvgPicture.asset(
            Assets.imagesSettingsRightArrowIc,
          ),
          onTap: () {
          },
        ),
        ListTile(
          title: const Text(
            AppStrings.contactUs,
          ),
          leading: const Icon(Icons.contact_page),
          trailing: SvgPicture.asset(
            Assets.imagesSettingsRightArrowIc,
          ),
          onTap: () {
           // Navigator.pushNamed(context, AppRouter.chatRoute);
          },
        ),
        ListTile(
          title: const Text(
            AppStrings.inviteYourFriends,
          ).tr(),
          leading: const Icon(Icons.share),
          trailing: SvgPicture.asset(
            Assets.imagesSettingsRightArrowIc,
          ),
          onTap: () {
            // _inviteFriends();
          },
        ),
        ListTile(
          title: const Text(
            AppStrings.logout,
          ).tr(),
          leading: const Icon(Icons.logout),
          trailing: SvgPicture.asset(
            Assets.imagesSettingsRightArrowIc,
          ),
          onTap: () {
            // _logout();
          },
        )
      ],
    );
  }
}
