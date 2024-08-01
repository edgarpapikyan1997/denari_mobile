import 'package:denari_app/data/profile/model/profile_model.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  final ProfileModel profile;

  const UserData({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            profile.name,
            textAlign: TextAlign.start,
            style: context.theme.headline2,
          ),
        ),
        const Delimiter(8),
        Text(
          profile.email,
          style: context.theme.body1,
        ),
      ],
    );
  }
}
