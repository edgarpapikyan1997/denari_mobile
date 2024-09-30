import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/store/profile/profile_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/listeners/auth_listener.dart';
import 'package:denari_app/utils/network/utils/use_case.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/profile/widgets/delete_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/location_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/log_out_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/notifications_sheet.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/buttons/button_menu.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../widgets/message.dart';
import 'invite_sheet.dart';

class ProfileMenu extends StatelessWidget {
  final ProfileModel profile;

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
            onPressed: () => context.goNamed(Routes.profilePassword),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.notifications'.tr(),
            svg: Assets.media.icons.bellRing.path,
            onPressed: () => showModalSheet(
              context: context,
              child: NotificationsSheet(profile: profile),
            ).then((value) =>
                Provider.of<ProfileState>(context, listen: false).getProfile()),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.location_services'.tr(),
            svg: Assets.media.icons.pinned.path,
            onPressed: () => showModalSheet(
              context: context,
              child: LocationSheet(profile: profile),
            ).then((value) =>
                Provider.of<ProfileState>(context, listen: false).getProfile()),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.invite_friends'.tr(),
            svg: Assets.media.icons.sendToBack.path,
            onPressed: () => showModalSheet<void>(
              context: context,
              child: const InviteSheet(),
            ),
          ),
          const Divider(height: 1),
          ButtonMenu(
            label: 'profile.delete_account'.tr(),
            svg: Assets.media.icons.delTe.path,
            iconColor: AppColors.alertRed,
            onPressed: () => showModalSheet<bool>(
              context: context,
              child: const DeleteSheet(),
            ).then((value) => value == true ? _deleteAccount() : null),
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

  _deleteAccount() async {
    final result =
        await handle(() => di.get<ProfileRepository>().deleteProfile());
    result.then(
      (value) => authListener.logout(),
      (error) => Message.show(error),
    );
  }
}
