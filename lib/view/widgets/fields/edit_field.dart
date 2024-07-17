import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'decoration_field.dart';

class EditField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final bool optional;

  const EditField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.optional = false,
  });

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  late final TextEditingController _controller;

  String get _hint =>
      widget.hint + (widget.optional ? ' (${'optional'.tr()})' : '');

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      style: context.theme.headline5.copyWith(
        color: AppColors.black,
      ),
      onChanged: widget.onChanged,
      decoration: DecorationField(
        context: context,
        controller: _controller,
        hint: _hint,
      ),
    );
  }
}
