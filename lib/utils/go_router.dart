import 'package:denari_app/view/screens/main_screen/send_gift_screen.dart';
import 'package:denari_app/view/screens/main_screen/token_balance_screen.dart';
import 'package:flutter/material.dart';
import 'package:denari_app/view/screens/authentication/code/code_screen.dart';
import 'package:denari_app/view/screens/authentication/forgot/forgot_screen.dart';
import 'package:denari_app/view/screens/authentication/password/create_password_screen.dart';
import 'package:denari_app/view/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:denari_app/view/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:go_router/go_router.dart';
import '../view/screens/shop_screen.dart';
import '../view/screens/main_screen/main_screen.dart';
import '../view/screens/notification_screen.dart';
import '../view/screens/profile_screen.dart';
import '../view/widgets/scaffold_nav_bar.dart';

final GoRouter router = GoRouter(
  routes: [
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
    GoRoute(
      path: '/sendGift',
      builder: (context, state) {
        return const SendGiftScreen();
      },
    ),
    // GoRoute(
    //   name: Routes.signIn,
    //   path: '/${Routes.signIn}',
    //   builder: (context, state) => const SignInScreen(),
    //   routes: [
    //     GoRoute(
    //       name: Routes.forgot,
    //       path: Routes.forgot,
    //       builder: (context, state) => const ForgotScreen(),
    //       routes: [
    //         GoRoute(
    //           name: Routes.forgotCode,
    //           path: Routes.code,
    //           builder: (context, state) =>
    //               CodeScreen(phone: state.extra as String),
    //           routes: [
    //             GoRoute(
    //               name: Routes.password,
    //               path: Routes.password,
    //               builder: (context, state) =>
    //                   CreatePasswordScreen(phone: state.extra as String),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
    // GoRoute(
    //   name: Routes.signUp,
    //   path: '/${Routes.signUp}',
    //   builder: (context, state) => const SignUpScreen(),
    //   routes: [
    //     GoRoute(
    //       name: Routes.code,
    //       path: Routes.code,
    //       builder: (context, state) => CodeScreen(phone: state.extra as String),
    //     ),
    //   ],
    // ),
  ],
//   refreshListenable: authListener,
//   redirect: (context, state) {
//     final path = state.uri.path;
//     final login = authListener.isLogin;
//     if (login && (path.contains(Routes.signUp) || path.contains(Routes.signIn))) {
//       return '/';
//     }
//     if (!login && !(path.contains(Routes.signUp) || path.contains(Routes.signIn))) {
//       return '/${Routes.signIn}';
//     }
//     return null;
//   },
);
//
// final class Routes {
//   static const signIn = 'sign-in';
//   static const signUp = 'sign-up';
//   static const forgot = 'forgot';
//   static const code = 'code';
//   static const forgotCode = 'f-code';
//   static const password = 'password';
// }
