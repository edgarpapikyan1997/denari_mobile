import 'package:go_router/go_router.dart';
import '../view/screens/gift_cards_screen.dart';
import '../view/screens/main_screen_screen.dart';
import '../view/screens/notification_screen.dart';
import '../view/screens/settings_screen.dart';
import '../view/widgets/scaffold_nav_bar.dart';

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
