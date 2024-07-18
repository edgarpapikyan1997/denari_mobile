import 'package:denari_app/view/screens/main_screen/my_qr_code.dart';
import 'package:denari_app/view/screens/main_screen/send_gift_screen.dart';
import 'package:denari_app/view/screens/main_screen/token_balance_screen.dart';
import 'package:denari_app/view/screens/main_screen/transaction_history.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../view/screens/main_screen/my_gift_cards_screen.dart';
import '../view/screens/shop_screen.dart';
import '../view/screens/main_screen/main_screen.dart';
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
          return const MainScreen();
        },
        routes: [
          GoRoute(
            path: 'tokenBalance',
            builder: (BuildContext context, GoRouterState state) {
              return const TokenBalanceScreen();
            },
          ),
          GoRoute(
            path: 'myGiftCards',
            builder: (BuildContext context, GoRouterState state) {
              return const MyGiftCardsScreen();
            },
          ),
          GoRoute(
            path: 'sendGift',
            builder: (BuildContext context, GoRouterState state) {
              return const SendGiftScreen();
            },
          ),
          GoRoute(
            path: 'myQRCode',
            builder: (BuildContext context, GoRouterState state) {
              return const MyQRCode();
            },
          ),
          GoRoute(
            path: 'transactionHistory',
            builder: (BuildContext context, GoRouterState state) {
              return const TransactionHistoryScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) {
          return const NotificationScreen();
        },
      ),
      GoRoute(
        path: '/shopScreen',
        builder: (context, state) {
          return const ShopScreen();
        },
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),
    ],
  ),
]);
