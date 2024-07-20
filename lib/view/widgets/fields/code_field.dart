import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodeField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const CodeField({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  State<CodeField> createState() => _EditFieldState();
}

class _EditFieldState extends State<CodeField> {
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
    return Pinput(
      length: 6,
      controller: _controller,
      showCursor: true,
      onChanged: widget.onChanged,
    );
  }
}
