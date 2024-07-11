import 'package:go_router/go_router.dart';
import '../view/screens/shop_screen.dart';
import '../view/screens/main_screen.dart';
import '../view/screens/notification_screen.dart';
import '../view/screens/profile_screen.dart';
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
        path: '/notifications',
        builder: (context, state) {
          return NotificationScreen();
        },
      ),
      GoRoute(
        path: '/shopScreen',
        builder: (context, state) {
          return ShopScreen();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return ProfileScreen();
        },
      ),
    ],
  ),
]);
