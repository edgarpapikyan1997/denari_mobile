import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/data/profile/model/profile.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/store/profile/profile_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/profile/widgets/code_pop_sheet.dart';
import 'package:denari_app/view/screens/profile/widgets/success_update_sheet.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/code_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:denari_app/view/widgets/resend_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

class ProfileCodePage extends StatefulWidget {
  final Profile model;

  const ProfileCodePage({super.key, required this.model});

  @override
  State<ProfileCodePage> createState() => _ProfileCodePageState();
}

class _ProfileCodePageState extends State<ProfileCodePage> {
  final ProfileState _state = ProfileState(
    authRepository: di.get<AuthRepository>(),
    profileRepository: di.get<ProfileRepository>(),
  );

  String get _numberText => '${'sign.on_number'.tr()}: ${widget.model.phone}';

  @override
  void initState() {
    _state.name = widget.model.name;
    _state.email = widget.model.email;
    _state.birthday = widget.model.dateOfBirth.toDate();
    _state.phone =
        PhoneNumber.fromCompleteNumber(completeNumber: widget.model.phone);
    reaction(
      (reaction) => _state.updateError,
      (value) {
        if (value == 'true') {
          showModalSheet<void>(
            context: context,
            child: const SuccessUpdateSheet(),
          ).then((value) => context.goNamed(Routes.profile));
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
    return Scaffold(
      appBar: AppBarPage(
        onPop: () => showModalSheet<bool>(
          context: context,
          child: const CodePopSheet(),
        ).then((value) => value == false ? context.pop() : null),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sign.sent_code'.tr(),
                style: context.theme.headline1.copyWith(color: AppColors.black),
              ),
              const Delimiter(2),
              Text(
                'profile.code_desc'.tr(),
                style: context.theme.body1
                    .copyWith(color: AppColors.lightGreyText),
              ),
              const Delimiter(2),
              Text(
                _numberText,
                style: context.theme.body1
                    .copyWith(color: AppColors.lightGreyText),
              ),
              const Delimiter(24),
              Observer(
                builder: (_) => CodeField(
                  error: !_state.isCodeValid ? 'sign.code_error'.tr() : null,
                  onChanged: (value) {
                    _state.setCode(value);
                    if (value.length >= 6) {
                      _state.updateProfile();
                    }
                  },
                ),
              ),
              Flexible(
                child: Observer(
                  builder: (_) {
                    if (_state.loading) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: ResendTimer(
                        onResend: () => _state.getCode(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
