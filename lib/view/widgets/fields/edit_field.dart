import 'package:denari_app/utils/app_colors.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

class EditField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;

  const EditField({
    super.key,
    required this.hint,
    this.controller, this.onChanged,
  });

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  late final TextEditingController _controller;

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
        color: AppColors.dark,
      ),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        isDense: true,
        border: FieldBorder(),
        enabledBorder: FieldBorder(),
        disabledBorder: FieldBorder(),
        errorBorder: FieldBorder(borderColor: AppColors.errorColor),
        hintText: widget.hint,
        hintStyle: context.theme.headline5.copyWith(
          color: AppColors.hintColor,
        ),
        filled: true,
        fillColor: AppColors.fieldColor,
        errorStyle: context.theme.headline6.copyWith(
          color: AppColors.errorColor,
        ),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                iconSize: 24,
                onPressed: _controller.clear,
              )
            : null,
      ),
    );
  }
}

class FieldBorder extends OutlineInputBorder {
  FieldBorder({
    Color? borderColor,
  }) : super(
          borderSide: BorderSide(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(12.0),
        );
}
