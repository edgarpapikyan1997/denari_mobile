import 'package:denari_app/data/authentication/repository/auth_repository.dart';
import 'package:denari_app/data/profile/repository/profile_repository.dart';
import 'package:denari_app/store/profile/profile_state.dart';
import 'package:denari_app/utils/di/config.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/screens/profile/widgets/profile_menu.dart';
import 'package:denari_app/view/screens/profile/widgets/user_banner.dart';
import 'package:denari_app/view/widgets/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileState _state = ProfileState(
    authRepository: di.get<AuthRepository>(),
    profileRepository: di.get<ProfileRepository>(),
  );

  @override
  void initState() {
    _state.getProfile();
    reaction(
      (reaction) => _state.getError,
      (value) {
        if (value != null) {
          Message.show(value);
        }
      },
      equals: (_, __) => false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.width, 142),
        child: Observer(
          builder: (context) => UserBanner(profile: _state.profile),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Observer(
          builder: (context) => ProfileMenu(profile: _state.profile),
        ),
      ),
    );
  }
}
