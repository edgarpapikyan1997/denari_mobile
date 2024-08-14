import 'package:denari_app/data/authentication/model/reg_model.dart';
import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/store/categories_state/categories_state.dart';
import 'package:denari_app/view/screens/main_screen/token_balance_screen.dart';
import 'package:denari_app/view/screens/profile/pages/change_password_page.dart';
import 'package:denari_app/view/screens/profile/pages/code_page.dart';
import 'package:denari_app/view/screens/profile/pages/create_password_page.dart';
import 'package:denari_app/view/screens/profile/pages/forgot_code_page.dart';
import 'package:denari_app/view/screens/profile/pages/forgot_page.dart';
import 'package:denari_app/view/screens/profile/pages/profile_page.dart';
import 'package:denari_app/view/screens/search_screen.dart';
import 'package:denari_app/view/screens/send_gift_screen/send_gift_card_screen.dart';
import 'package:denari_app/view/screens/shops_screen/chosen_category_screen.dart';
import 'package:denari_app/view/screens/shops_screen/shop_screen_filter.dart';
import 'package:denari_app/view/screens/store_field_screen/alliance_screen/alliance_screen.dart';
import 'package:denari_app/view/screens/store_field_screen/store_field_item_screen.dart';
import 'package:denari_app/view/widgets/brand_item/brand_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../data/authentication/model/reset_pass_model.dart';
import '../view/screens/authentication/code/forgot_code_screen.dart';
import '../view/screens/authentication/code/sign_up_code_screen.dart';
import '../view/screens/authentication/forgot/forgot_screen.dart';
import '../view/screens/authentication/password/create_password_screen.dart';
import '../view/screens/authentication/sign_in/sign_in_screen.dart';
import '../view/screens/authentication/sign_up/sign_up_screen.dart';
import '../view/screens/main_screen/main_screen.dart';
import '../view/screens/main_screen/my_gift_cards_screen.dart';
import '../view/screens/map_screen/map_screen.dart';
import '../view/screens/notifications/notification_screen.dart';
import '../view/screens/profile/profile_screen.dart';
import '../view/screens/send_gift_screen/send_gift_screen.dart';
import '../view/screens/shops_screen/shop_screen.dart';
import '../view/widgets/scaffold_nav_bar.dart';
import 'listeners/auth_listener.dart';

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
            GoRoute(
                path: 'myGiftCardsScreen',
                builder: (BuildContext context, GoRouterState state) {
                  return const MyGiftCardsScreen();
                })
          ],
        ),
        GoRoute(
          name: Routes.notifications,
          path: '/${Routes.notifications}',
          builder: (context, state) => const NotificationScreen(),
        ),
        GoRoute(
          path: '/shopsScreen',
          builder: (context, state) {
            return const ShopsScreen();
          },
        ),
        GoRoute(
          path: '/searchScreen',
          builder: (context, state) {
            return const SearchScreen();
          },
        ),
        GoRoute(
          path: '/chosenCategoryScreen',
          builder: (context, state) {
            final CategoriesState? categoriesState =
                state.extra as CategoriesState?;
            return ChosenCategoryScreen(
              categoriesState: categoriesState,
            );
          },
        ),
        GoRoute(
          path: '/shopScreenFilter',
          builder: (context, state) {
            return const ShopScreenFilter();
          },
        ),
        GoRoute(
          path: '/storeFieldItemScreen',
          builder: (context, state) {
            return const StoreFieldItemScreen();
          },
        ),
        GoRoute(
            path: '/alliance',
            builder: (context, state) {
              return AllianceScreen(
                isAlliance: state.extra as bool?,
              );
            }),
        GoRoute(
          name: Routes.profile,
          path: '/${Routes.profile}',
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              name: Routes.profileData,
              path: Routes.profileData,
              builder: (context, state) => ProfilePage(
                profile: state.extra as ProfileModel,
              ),
              routes: [
                GoRoute(
                  name: Routes.profileCode,
                  path: Routes.code,
                  builder: (context, state) =>
                      ProfileCodePage(model: state.extra as ProfileModel),
                ),
              ],
            ),
            GoRoute(
              name: Routes.profilePassword,
              path: Routes.password,
              builder: (context, state) => const ChangePasswordPage(),
              routes: [
                GoRoute(
                  name: Routes.profileForgot,
                  path: Routes.forgot,
                  builder: (context, state) => const ForgotPage(),
                  routes: [
                    GoRoute(
                      name: Routes.profileForgotCode,
                      path: Routes.code,
                      builder: (context, state) =>
                          ForgotCodePage(model: state.extra as ResetPassModel),
                      routes: [
                        GoRoute(
                          name: Routes.profileReset,
                          path: Routes.password,
                          builder: (context, state) => CreatePasswordPage(
                              model: state.extra as ResetPassModel),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/mapScreen',
      builder: (context, state) {
        return const MapScreen();
      },
    ),
    GoRoute(
        path: '/sendGift',
        builder: (context, state) {
          return const SendGiftScreen();
        },
        routes: [
          GoRoute(
              name: 'sendGiftCardScreen',
              path: 'sendGiftCardScreen',
              builder: (context, state) {
                BrandItemWidget brandItemWidget =
                    state.extra as BrandItemWidget;
                return SendGiftCardScreen(brandItemWidget: brandItemWidget);
              }),
        ]),
    GoRoute(
      name: Routes.signIn,
      path: '/${Routes.signIn}',
      builder: (context, state) => const SignInScreen(),
      routes: [
        GoRoute(
          name: Routes.forgot,
          path: Routes.forgot,
          builder: (context, state) => const ForgotScreen(),
          routes: [
            GoRoute(
              name: Routes.forgotCode,
              path: Routes.code,
              builder: (context, state) =>
                  ForgotCodeScreen(model: state.extra as ResetPassModel),
              routes: [
                GoRoute(
                  name: Routes.password,
                  path: Routes.password,
                  builder: (context, state) => CreatePasswordScreen(
                      model: state.extra as ResetPassModel),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      name: Routes.signUp,
      path: '/${Routes.signUp}',
      builder: (context, state) => const SignUpScreen(),
      routes: [
        GoRoute(
          name: Routes.code,
          path: Routes.code,
          builder: (context, state) =>
              SignUpCodeScreen(model: state.extra as RegModel),
        ),
      ],
    ),
  ],
  refreshListenable: authListener,
  redirect: (context, state) {
    final path = state.uri.path;
    final login = authListener.isLogin;
    if (login &&
        (path.contains(Routes.signUp) || path.contains(Routes.signIn))) {
      return '/';
    }
    if (!login &&
        !(path.contains(Routes.signUp) || path.contains(Routes.signIn))) {
      return '/${Routes.signIn}';
    }
    return null;
  },
);

final class Routes {
  static const signIn = 'sign-in';
  static const signUp = 'sign-up';
  static const forgot = 'forgot';
  static const code = 'code';
  static const forgotCode = 'f-code';
  static const profileCode = 'p-code';
  static const password = 'password';
  static const profile = 'profile';
  static const profileData = 'data';
  static const profilePassword = 'p-password';
  static const profileForgot = 'p-forgot';
  static const profileForgotCode = 'p-f-forgot';
  static const profileReset = 'p-reset';
  static const notifications = 'notifications';
}
