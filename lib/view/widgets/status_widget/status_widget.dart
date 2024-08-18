import 'package:denari_app/utils/extensions/context_extension.dart';
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
        color: widget.status == 'onHold'
            ? statusColor = AppColors.statusOnHold
            : widget.status == 'cancelled'
                ? statusColor = AppColors.statusCancelled
                : widget.status == 'completed'
                    ? statusColor = AppColors.statusComplete
                    : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        widget.status,
        style: widget.status == 'onHold'
            ? context.theme.body2.statusOnHold
            : widget.status == 'cancelled'
                ? context.theme.body2.alertRed
                : widget.status == 'completed'
                    ? context.theme.body2.completed
                    : null,
        softWrap: true,
      ),
    );
  }
}
