import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/profile/bloc/settings_bloc.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:denari_app/view/widgets/switch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsSheet extends StatefulWidget {
  final ProfileModel profile;

  const NotificationsSheet({super.key, required this.profile});

  @override
  State<NotificationsSheet> createState() => _NotificationsSheetState();
}

class _NotificationsSheetState extends State<NotificationsSheet> {
  late final SettingsBloc _bloc;
  late bool _transState;
  late bool _advState;

  @override
  void initState() {
    _bloc = SettingsBloc(profileRepository: di.get<ProfileRepository>());
    _transState = widget.profile.transactionNotification;
    _advState = widget.profile.advertisements;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NotificationsSheet oldWidget) {
    _transState = widget.profile.transactionNotification;
    _advState = widget.profile.advertisements;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      bloc: _bloc,
      listener: _listenErrors,
      child: ModalSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'profile.notifications'.tr(),
              style: context.theme.headline2,
            ),
            const Delimiter(8),
            SwitchText(
              text: 'profile.transaction_notifications'.tr(),
              initValue: _transState,
              onChanged: (value) {
                _transState = value;
                _bloc.add(SetNotificationsStateEvent(_transState, _advState));
              },
            ),
            const Divider(height: 1, color: AppColors.bottomSheetPieceGrey),
            SwitchText(
              text: 'profile.advertisements'.tr(),
              initValue: _advState,
              onChanged: (value) {
                _advState = value;
                _bloc.add(SetNotificationsStateEvent(_transState, _advState));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _listenErrors(BuildContext context, SettingsState state) {
    if (state is SettingsErrorState) {
      Message.show(state.error ?? 'Error operation');
    }
  }
}
