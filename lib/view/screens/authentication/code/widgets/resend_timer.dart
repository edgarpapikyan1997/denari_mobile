import 'dart:async';

import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/countdown.dart';
import 'package:denari_app/view/widgets/text_with_link.dart';
import 'package:flutter/material.dart';

class ResendTimer extends StatefulWidget {
  final VoidCallback onResend;

  const ResendTimer({super.key, required this.onResend});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> {
  final _duration = const Duration(minutes: 1);
  Timer? _timer;

  @override
  void initState() {
    _createTimer();
    super.initState();
  }

  void _createTimer() {
    _timer = Timer(
      _duration,
          () => setState(() => _timer == null),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_timer?.isActive == true) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: 'sign.can_resend'.tr()),
            const TextSpan(text: ': '),
            WidgetSpan(
              child: Countdown(
                duration: _duration,
                builder: (duration) {
                  final minutes = duration.inMinutes.toString();
                  final seconds =
                      (duration.inSeconds % Duration.secondsPerMinute)
                          .toString();
                  return Text(
                    '${minutes..padLeft(2, "0")}:${seconds.padLeft(2, "0")}',
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
    return TextWithLink(
      text: 'sign.did_not_code'.tr(),
      link: 'sign.resend_it'.tr(),
      onTap: () {
        widget.onResend.call();
        setState(() => _createTimer());
      },
    );
  }
}
