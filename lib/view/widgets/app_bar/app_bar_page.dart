import 'package:denari_app/gen/assets.gen.dart';
import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/view/widgets/delimiter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarPage extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarPage({super.key, this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          16.0, MediaQuery.paddingOf(context).top, 16.0, 0.0),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 24,
            child: InkWell(
              onTap: context.pop,
              borderRadius: BorderRadius.circular(8),
              child: Assets.media.icons.chevronLeft.svg(),
            ),
          ),
          Flexible(
            child: Center(
              child: Text(
                title,
                style: context.theme.headline4,
              ),
            ),
          ),
          const Delimiter(24),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(0, 44);
}
