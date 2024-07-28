import 'dart:async';

import 'package:flutter/material.dart';

class Countdown extends StatefulWidget {
  final Duration duration;
  final Widget Function(Duration duration) builder;

  const Countdown({
    super.key,
    required this.duration,
    required this.builder,
  });

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late final Timer _timer;
  late Duration _current;

  @override
  void initState() {
    _current = widget.duration;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(() {
            if (_current.inSeconds > 0) {
              _current = Duration(seconds: _current.inSeconds - 1);
            } else {
              _current = Duration.zero;
            }
          });
        } else {
          timer.cancel();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(_current);
  }
}
