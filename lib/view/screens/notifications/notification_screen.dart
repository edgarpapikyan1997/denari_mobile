import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/notifications/widgets/notification_item.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: 'main.notifications'.tr()),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) => NotificationItem(
            message: 'Message #$index',
            date: DateTime.now(),
          ),
          separatorBuilder: (context, int index) => const Divider(
            height: 32,
            thickness: 1,
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
