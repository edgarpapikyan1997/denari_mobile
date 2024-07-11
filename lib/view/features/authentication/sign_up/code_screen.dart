import 'package:denari_app/utils/app_colors.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:denari_app/view/widgets/fields/code_field.dart';
import 'package:flutter/material.dart';

class CodeScreen extends StatefulWidget {
  final String phone;

  const CodeScreen({super.key, required this.phone});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  String get _numberText => '${'sign.on_number'.tr()}: ${widget.phone}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'sign.sent_code'.tr(),
                style: context.theme.headline1.copyWith(color: AppColors.dark),
              ),
              const Delimiter(2),
              Text(_numberText),
              const Delimiter(24),
              CodeField(
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
