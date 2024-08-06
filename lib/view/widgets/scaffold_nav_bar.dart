import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/go_router.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/utils/themes/dark_theme.dart';
import 'package:denari_app/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../gen/assets.gen.dart';
import '../../model/qr_id.dart';
import '../../store/nottom_nav_bar_state/bottom_nav_bar_state.dart';

final bottomNavBarState = BottomNavBarState();

class ScaffoldNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldNavBar({required this.child, super.key});

  @override
  State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
}

class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
  final qrIdReceiver = GetIt.instance<QRIdReceiver>();
  int selectedValue = 0;
  PageController pageController = PageController(initialPage: 0);
  ThemeData theme =
      SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? darkTheme
          : lightTheme;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: widget.child,
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          backgroundColor: theme.navigationBarTheme.backgroundColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: context.theme.navBar,
          unselectedLabelStyle: context.theme.navBar.regular,
          currentIndex: bottomNavBarState.index,
          unselectedItemColor: AppColors.lightGreyText,
          selectedItemColor: AppColors.black,
          items: [
            BottomNavigationBarItem(
                icon: Assets.media.icons.circleUserRound
                    .svg(
                      height: 24,
                      width: 24,
                    )
                    .paddingSymmetric(vertical: 8),
                label: 'main.profile'.tr()),
            BottomNavigationBarItem(
                icon: Assets.media.icons.bell
                    .svg(
                      height: 24,
                      width: 24,
                    )
                    .paddingSymmetric(vertical: 8),
                label: 'main.notifications'.tr()),
            BottomNavigationBarItem(
                icon: CircleAvatar(
                  backgroundColor: AppColors.alertRed,
                  child: Assets.media.icons.scanLine.svg(
                    height: 24,
                    width: 24,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Assets.media.icons.store
                    .svg(
                      height: 24,
                      width: 24,
                    )
                    .paddingSymmetric(vertical: 8),
                label: 'main.store'.tr()),
            BottomNavigationBarItem(
                icon: Assets.media.icons.house
                    .svg(
                      height: 24,
                      width: 24,
                    )
                    .paddingSymmetric(vertical: 8),
                label: 'Home'),
          ],
          onTap: (index) {
            bottomNavBarState.changeIndex(index);
            switch (index) {
              case 0:
                context.goNamed(Routes.profile);
                break;
              case 1:
                context.go('/notifications');
                break;
              case 2:
                break;
              case 3:
                context.go('/shopScreen');
                break;
              case 4:
                context.go('/');
                break;
              default:
                context.go('/');
            }
          },
        );
      }),
    );
  }
}
