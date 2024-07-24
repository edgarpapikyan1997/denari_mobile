import 'package:denari_app/data/authentication/model/reset_model.dart';
import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/store/authentication/forgot_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/authentication/code/widgets/resend_timer.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/code_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/phone_number.dart';

class ForgotCodeScreen extends StatefulWidget {
  final ResetModel model;

  const ForgotCodeScreen({super.key, required this.model});

  @override
  State<ForgotCodeScreen> createState() => _ForgotCodeScreenState();
}

class _ForgotCodeScreenState extends State<ForgotCodeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ForgotState _state = ForgotState(
    authRepository: di.get<AuthRepository>(),
  );

  String get _numberText => '${'sign.on_number'.tr()}: ${widget.model.phone}';

  @override
  void initState() {
    _state.phone =
        PhoneNumber.fromCompleteNumber(completeNumber: widget.model.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.black,
          onPressed: context.pop,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sign.enter_confirm_code'.tr(),
                style: context.theme.headline1.copyWith(color: AppColors.black),
              ),
              const Delimiter(2),
              Text(_numberText),
              const Delimiter(24),
              Observer(
                builder: (_) => CodeField(
                  error: !_state.isCodeValid ? 'sign.code_error'.tr() : null,
                  onChanged: (value) => _state.setCode(value),
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
              Observer(
                builder: (_) => ButtonPrimary(
                  label: 'sign.send_code'.tr(),
                  onPressed: _state.isCodeValid
                      ? () => context.goNamed(Routes.password,
                          extra: ResetModel(
                            phone: _state.phone!.completeNumber,
                            code: _state.code,
                            newPassword: '',
                          ))
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
