import 'package:denari_app/data/profile/model/profile.dart';
import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/listeners/auth_listener.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/profile/widgets/delete_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/location_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/log_out_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/notifications_sheet.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/buttons/button_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileMenu extends StatelessWidget {
  final Profile profile;

  const ProfileMenu({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ButtonMenu(
            label: 'profile.data'.tr(),
            svg: Assets.media.icons.squarePen.path,
            onPressed: () => context.goNamed(
              Routes.profileData,
              extra: profile,
            ),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.change_password'.tr(),
            svg: Assets.media.icons.lock.path,
            onPressed: () => {},
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.notifications'.tr(),
            svg: Assets.media.icons.bellRing.path,
            onPressed: () => showModalSheet(
              context: context,
              child: const NotificationsSheet(),
            ),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.location_services'.tr(),
            svg: Assets.media.icons.pinned.path,
            onPressed: () => showModalSheet(
              context: context,
              child: const LocationSheet(),
            ),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.invite_friends'.tr(),
            svg: Assets.media.icons.sendToBack.path,
            onPressed: () => {},
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.delete_account'.tr(),
            svg: Assets.media.icons.delTe.path,
            iconColor: AppColors.alertRed,
            onPressed: () => showModalSheet<bool>(
              context: context,
              child: const DeleteSheet(),
            ),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.log_out'.tr(),
            svg: Assets.media.icons.logOut.path,
            iconColor: AppColors.alertRed,
            onPressed: () => showModalSheet<bool>(
              context: context,
              child: const LogOutSheet(),
            ).then((value) => value == true ? authListener.logout() : null),
          ),
        ],
      ),
    );
  }
}
