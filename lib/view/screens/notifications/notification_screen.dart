import 'package:denari_app/view/screens/notifications/bloc/messages_bloc.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/notifications/widgets/no_notifications.dart';
import 'package:denari_app/view/screens/notifications/widgets/notification_item.dart';
import 'package:denari_app/view/widgets/app_bar/app_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPage(title: 'main.notifications'.tr()),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: BlocBuilder<MessagesBloc, MessagesState>(
          builder: (context, state) {
            if (state is WorkMessagesState) {
              final notifications = state.notifications;
              if (notifications == null || notifications.isEmpty) {
                return const NoNotifications();
              }
              return ListView.separated(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return NotificationItem(
                    key: ValueKey('notification_${notification.id}'),
                    message: notification.message,
                    date: notification.createdAt.toDate(),
                  );
                },
                separatorBuilder: (context, int index) => const Divider(
                  height: 32,
                  thickness: 1,
                  color: AppColors.borderColor,
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
