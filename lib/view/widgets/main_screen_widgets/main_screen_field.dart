import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/themes/app_colors.dart';
import '../bottom_sheet/qr_bottom_sheet.dart';

class MainScreenField extends StatelessWidget {
  final Widget asset;
  final String title;
  final String navigationTitle;
  final String? userID;
  final String? token;


  const MainScreenField({super.key,
    required this.asset,
    required this.title,
    required this.navigationTitle,
    this.userID,
    this.token,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigationTitle == "/myQRCode") {
          showQRBottomSheet(
              context: context,
              title: 'main.navBarQR'.tr(),
              description: 'main.getTokens'.tr(),
              userID: userID!,
              token: token,
              isEnabled: true);
        } else {
          context.push(navigationTitle);
        }
      },
      child: SizedBox(
        child: Column(
          children: [
            CircleAvatar(
                backgroundColor: AppColors.white,
                radius: 32,
                child: SizedBox(height: 32, width: 32, child: asset))
                .paddingOnly(bottom: 8),
            SizedBox(
                child: Text(
              title,
              style: context.theme.body3,
              textAlign: TextAlign.center,
              maxLines: 2,
            )),
          ],
        ),
      ),
    );
  }
}
