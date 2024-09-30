import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/store/profile/invite_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/edit_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'success_invite_sheet.dart';

class InviteSheet extends StatefulWidget {
  const InviteSheet({super.key});

  @override
  State<InviteSheet> createState() => _InviteSheetState();
}

class _InviteSheetState extends State<InviteSheet> {
  final InviteState _state = InviteState(
    profileRepository: di.get<ProfileRepository>(),
  );

  @override
  void initState() {
    reaction(
      (reaction) => _state.inviteError,
      (value) {
        Navigator.of(context).pop();
        if (value == 'true') {
          showModalSheet<void>(
            context: context,
            child: const SuccessInviteSheet(),
          );
        } else if (value != null) {
          Message.show(value);
        }
      },
      equals: (_, __) => false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'profile.invite_friends'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(8),
          Text(
            'profile.invite_desc'.tr(),
            style: context.theme.body1.copyWith(color: AppColors.lightGreyText),
          ),
          const Delimiter(),
          Observer(
            builder: (_) => EditField(
              hint: 'profile.email_or_phone'.tr(),
              error: !_state.isContactValid ? 'profile.invite_error'.tr() : null,
              onChanged: _state.setContact,
            ),
          ),
          const Delimiter(),
          Observer(
            builder: (_) => ButtonPrimary(
              label: 'profile.send_invite'.tr(),
              onPressed: _state.inviteButtonEnabled ? _state.invite : null,
            ),
          ),
        ],
      ),
    );
  }
}
