import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldNavBar extends StatefulWidget {
  final Widget child;

  const ScaffoldNavBar({required this.child, Key? key}) : super(key: key);

  @override
  State<ScaffoldNavBar> createState() => _ScaffoldNavBarState();
}

class _ScaffoldNavBarState extends State<ScaffoldNavBar> {
  int selectedValue = 0;
  PageController pageController = PageController(initialPage:0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
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
