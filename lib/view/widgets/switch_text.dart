import 'package:flutter/material.dart';

class SwitchText extends StatefulWidget {
  final String text;
  final bool? initValue;
  final ValueChanged<bool>? onChanged;

  const SwitchText({
    super.key,
    required this.text,
    this.initValue,
    this.onChanged,
  });

  @override
  State<SwitchText> createState() => _SwitchTextState();
}

class _SwitchTextState extends State<SwitchText> {
  late bool _value;

  @override
  void initState() {
    _value = widget.initValue ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      applyCupertinoTheme: true,
      contentPadding: EdgeInsets.zero,
      title: Text(widget.text),
      value: _value,
      onChanged: (value) => setState(() {
        _value = value;
        widget.onChanged?.call(_value);
      }),
    );
  }
}
