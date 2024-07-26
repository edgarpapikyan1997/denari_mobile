import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/screens/profile/widgets/profile_menu.dart';
import 'package:denari_app/view/screens/profile/widgets/user_banner.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 142),
        child: const UserBanner(),
      ),
      body:  const SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ProfileMenu(),
      ),
    );
  }
}
