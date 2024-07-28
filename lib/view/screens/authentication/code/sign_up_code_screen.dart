import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/authentication/sign_up_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/network/data/token_preferences.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/code_field.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mobx/mobx.dart';

import 'widgets/resend_timer.dart';

class SignUpCodeScreen extends StatefulWidget {
  final RegModel model;

  const SignUpCodeScreen({super.key, required this.model});

  @override
  State<SignUpCodeScreen> createState() => _SignUpCodeScreenState();
}

class _SignUpCodeScreenState extends State<SignUpCodeScreen> {
  final SignUpState _state = SignUpState(
    authRepository: di.get<AuthRepository>(),
    tokenPreferences: di.get<TokenPreferences>(),
  );

  String get _numberText => '${'sign.on_number'.tr()}: ${widget.model.phone}';

  @override
  void initState() {
    _state.phone =
        PhoneNumber.fromCompleteNumber(completeNumber: widget.model.phone);
    reaction(
      (reaction) => _state.signUpError,
      (value) {
        if (value == null) {
          context.goNamed(Routes.password);
        } else {
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
      appBar: const AppBarPage(),
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
              Text(_numberText),
              const Delimiter(24),
              Observer(
                builder: (_) => CodeField(
                  error: !_state.isCodeValid ? 'sign.code_error'.tr() : null,
                  onChanged: (value) {
                    _state.setCode(value);
                    if (value.length >= 6) {
                      // sendCode;
                      // _state.signUp();
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
