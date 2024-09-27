import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import '../../../utils/themes/app_colors.dart';

class StatusWidget extends StatefulWidget {
  final String status;

  const StatusWidget({
    super.key,
    required this.status,
  });

  @override
  State<StatusWidget> createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  Color statusColor = AppColors.statusComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: widget.status == 'status.onHold'.tr() ||
                widget.status == 'status.onHold'
            ? statusColor = AppColors.statusOnHold
            : widget.status == 'status.cancelled'.tr()
                ? statusColor = AppColors.statusCancelled
                : widget.status == 'status.completed'.tr()
                    ? statusColor = AppColors.statusComplete
                    : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        textAlign: TextAlign.center,
        widget.status == 'status.onHold' ? 'status.onHold'.tr() : widget.status,
        style: widget.status == 'status.onHold'.tr() ||
                widget.status == 'status.onHold'
            ? context.theme.body2.statusOnHold
            : widget.status == 'status.cancelled'.tr()
                ? context.theme.body2.alertRed
                : widget.status == 'status.completed'.tr()
                    ? context.theme.body2.completed
                    : null,
        softWrap: true,
      ),
    );
  }
}
