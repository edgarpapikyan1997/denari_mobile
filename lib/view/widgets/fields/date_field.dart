import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/widgets/bottom_sheet/variants/modal_sheet.dart';
import 'package:denari_app/view/widgets/buttons/button_primary.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:scroll_wheel_date_picker/scroll_wheel_date_picker.dart';

import 'decoration_field.dart';

class DateField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<DateTime>? onChanged;
  final bool optional;
  final String? error;
  final bool obscure;
  final DateTime? value;

  const DateField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.optional = false,
    this.error,
    this.obscure = false,
    this.value,
  });

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  late final TextEditingController _controller;
  late bool _obscure;
  String? _error;

  String get _hint =>
      widget.hint + (widget.optional ? ' (${'optional'.tr()})' : '');

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.value != null) {
      _controller.text = widget.value!.print();
    }
    _error = widget.error;
    _obscure = widget.obscure ? true : false;
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DateField oldWidget) {
    _error = widget.error;
    super.didUpdateWidget(oldWidget);
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
      obscureText: _obscure,
      style: context.theme.body1.copyWith(
        color: AppColors.black,
      ),
      onTap: _showDatePicker,
      decoration: DecorationField(
        context: context,
        controller: _controller,
        hint: _hint,
        error: _error,
        obscure: _obscure,
        onObscured:
            widget.obscure ? (value) => setState(() => _obscure = value) : null,
      ),
      readOnly: true,
    );
  }

  void _showDatePicker() {
    final currentDate = DateTime.now();
    final initDate = currentDate.copyWith(year: currentDate.year - 18);
    final lastDate = initDate.copyWith(day: initDate.day + 1);
    showModalSheet<DateTime>(
      context: context,
      child: BottomDatePicker(
        lastDate: lastDate,
        initialDate: initDate,
      ),
    ).then((value) {
      if (value != null) {
        _controller.text = value.print();
        widget.onChanged?.call(value);
      }
    });
  }
}

class BottomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime lastDate;

  const BottomDatePicker({
    super.key,
    required this.lastDate,
    this.initialDate,
  });

  @override
  State<BottomDatePicker> createState() => _BottomDatePickerState();
}

class _BottomDatePickerState extends State<BottomDatePicker> {
  DateTime? _value;

  @override
  Widget build(BuildContext context) {
    return ModalSheet(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'profile.select_date'.tr(),
            style: context.theme.headline2,
          ),
          const Delimiter(8),
          Flexible(
            child: ScrollWheelDatePicker(
              theme: FlatDatePickerTheme(
                backgroundColor: Colors.white,
                overlay: ScrollWheelDatePickerOverlay.highlight,
                itemTextStyle: context.theme.button,
                overlayColor: AppColors.pickerColor,
                overAndUnderCenterOpacity: 0.2,
              ),
              initialDate: widget.initialDate,
              lastDate: widget.lastDate,
              onSelectedItemChanged: (value) => setState(() => _value = value),
            ),
          ),
          const Delimiter(32),
          ButtonPrimary(
            label: 'profile.apply'.tr(),
            onPressed:
                _value != null ? () => Navigator.of(context).pop(_value) : null,
          ),
        ],
      ),
    );
  }
}
