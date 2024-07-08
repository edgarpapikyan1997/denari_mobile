import 'package:denari_app/presenter/screens/gift_cards_screen.dart';
import 'package:denari_app/presenter/screens/notification_screen.dart';
import 'package:denari_app/presenter/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import '../presenter/screens/main_screen_screen.dart';
import '../presenter/widgets/scaffold_nav_bar.dart';

final GoRouter router = GoRouter(routes: [
  ShellRoute(
    builder: (context, state, child) {
      return ScaffoldNavBar(child: child);
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return MainScreen();
        },
      ),
      GoRoute(
        path: '/giftCards',
        builder: (context, state) {
          return GiftCardsScreen();
        },
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) {
          return NotificationScreen();
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) {
          return SettingsScreen();
        },
      ),
    ],
  ),
]);
