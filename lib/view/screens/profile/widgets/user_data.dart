import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: context.theme.headline2,
        ),
        Text(
          'Surname',
          style: context.theme.headline2,
        ),
        const Delimiter(8),
        Text(
          'email',
          style: context.theme.body1,
        ),
      ],
    );
  }
}
