import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/buttons/button_menu.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
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
            onPressed: () => {},
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
            onPressed: () => {},
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.location_services'.tr(),
            svg: Assets.media.icons.pinned.path,
            onPressed: () => {},
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
            onPressed: () => {},
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.log_out'.tr(),
            svg: Assets.media.icons.logOut.path,
            iconColor: AppColors.alertRed,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
