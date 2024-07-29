import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodeField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? error;

  const CodeField({
    super.key,
    this.controller,
    this.onChanged,
    this.error,
  });

  @override
  State<CodeField> createState() => _EditFieldState();
}

class _EditFieldState extends State<CodeField> {
  late final TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _error = widget.error;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CodeField oldWidget) {
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
    return Pinput(
      length: 6,
      controller: _controller,
      showCursor: true,
      onChanged: widget.onChanged,
      errorText: _error,
    );
  }
}
