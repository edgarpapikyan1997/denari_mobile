import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:denari_app/view/screens/profile/widgets/user_data.dart';
import 'package:denari_app/view/screens/profile/widgets/user_photo.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class UserBanner extends StatelessWidget {
  final ProfileModel profile;

  const UserBanner({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.yellowLight,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top + 24,
          left: 16,
          right: 16,
          bottom: 24,
        ),
        child: Row(
          children: [
            const UserPhoto(),
            const Delimiter(16),
            UserData(profile: profile),
          ],
        ),
      ),
    );
  }
}
