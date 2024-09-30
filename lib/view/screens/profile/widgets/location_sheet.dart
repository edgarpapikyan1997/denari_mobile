import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/screens/profile/bloc/settings_bloc.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:denari_app/view/widgets/switch_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSheet extends StatefulWidget {
  final ProfileModel profile;

  const LocationSheet({super.key, required this.profile});

  @override
  State<LocationSheet> createState() => _LocationSheetState();
}

class _LocationSheetState extends State<LocationSheet> {
  late final SettingsBloc _bloc;
  late bool _gpsState;

  @override
  void initState() {
    _bloc = SettingsBloc(profileRepository: di.get<ProfileRepository>());
    _gpsState = widget.profile.transactionNotification;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LocationSheet oldWidget) {
    _gpsState = widget.profile.transactionNotification;
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
              'profile.location_services'.tr(),
              style: context.theme.headline2,
            ),
            const Delimiter(8),
            SwitchText(
              text: 'profile.use_gps'.tr(),
              initValue: _gpsState,
              onChanged: (value) {
                _gpsState = value;
                _bloc.add(SetGpsStateEvent(_gpsState));
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
