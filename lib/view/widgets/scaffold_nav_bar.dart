import 'package:denari_app/utils/extensions/context_extension.dart';
import 'package:denari_app/utils/extensions/widget_extension.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/utils/themes/dark_theme.dart';
import 'package:denari_app/utils/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';

class ScaffoldNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldNavBar({required this.child, Key? key}) : super(key: key);

  @override
  State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
}

class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
  int selectedValue = 0;
  PageController pageController = PageController(initialPage: 0);
  ThemeData theme = SchedulerBinding.instance.platformDispatcher
      .platformBrightness == Brightness.dark ? darkTheme : lightTheme;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.navigationBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(color: Colors.blue,),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue, // Change to your desired selected color
        unselectedItemColor: Colors.black,
        currentIndex: selectedValue,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.card_giftcard,
              ),
              label: 'Gift Cards'),
          BottomNavigationBarItem(
              icon: Icon(
                size: 33,
                Icons.circle,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
              ),
              label: 'Notifications'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            selectedValue = index;
          });
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/giftCards');
              break;
            case 2:
              context.go('/notifications');
              break;
            case 3:
              context.go('/settings');
              break;
            default:
              context.go('/');
          }
        },
      ),
    );
  }
}
