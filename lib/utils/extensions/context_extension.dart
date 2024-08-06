import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../gen/fonts.gen.dart';
import '../themes/app_colors.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get media => MediaQuery.of(this);

  SchedulerBinding get schedulerBinding => SchedulerBinding.instance;

  double get height => media.size.height;

  double get bodyHeight => height - 100;

  double get width => media.size.width;

  double get topPadding => media.padding.top;

  double get bottomPadding => media.padding.bottom;

  bool get isDarkMode => media.platformBrightness == Brightness.dark;

  bool get isDarkModeNoContextCheck =>
      schedulerBinding.platformDispatcher.platformBrightness == Brightness.dark;
}

extension ThemeDataHelper on ThemeData {
  TextStyle get headline1 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w600,
        fontSize: 32,
        height: 1.20,
      );

  TextStyle get headline2 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        height: 1.20,
      );

  TextStyle get headline3 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        height: 1.20,
      );

  TextStyle get headline4 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.20,
      );

  TextStyle get headline5 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w700,
        fontSize: 24,
        height: 1.26,
      );

  TextStyle get headline6 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w600,
        fontSize: 26,
        height: 1.20,
      );

  TextStyle get body1 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.22,
      );

  TextStyle get body2 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.40,
      );

  TextStyle get body3 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.18,
      );

  TextStyle get body4 => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.18,
      );

  TextStyle get caption => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.0,
      );

  TextStyle get navBar => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w500,
        fontSize: 11,
        height: 1.20,
      );

  TextStyle get button => const TextStyle(
        color: AppColors.black,
        fontFamily: FontFamily.onest,
        fontWeight: FontWeight.w500,
        height: 1.20,
        fontSize: 16,
      );

  TextStyle get subtitle1 => textTheme.titleMedium!;

  TextStyle get subtitle2 => textTheme.titleSmall!;

  TextStyle get subtitle3 => textTheme.titleSmall!
      .copyWith(
        fontSize: 14,
        letterSpacing: -0.01,
      )
      .medium;

  TextStyle get button1 => textTheme.labelLarge!;

  TextStyle get button2 => textTheme.labelLarge!.copyWith(
        fontSize: 16,
        height: 1.25,
      );

  TextStyle get button3 => textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1,
      );

  TextStyle get button4 => textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1,
      );

  TextStyle get bodyText1 => textTheme.bodyLarge!;

  TextStyle get bodyText2 => textTheme.bodyMedium!;

  TextStyle get bodyText3 => textTheme.bodyMedium!.bold;

  TextStyle get body17 => textTheme.bodyMedium!.size(17);

  TextStyle get caption1 => textTheme.bodySmall!;

  TextStyle get caption2 => textTheme.bodySmall!.bold;

  TextStyle get overline => textTheme.labelSmall!;

  ButtonStyle get elevatedButtonStyle => elevatedButtonTheme.style!;

  ButtonStyle get textButtonStyle => textButtonTheme.style!;
}

extension ElevatedButtonHelper on ButtonStyle {
  ButtonStyle buttonColor(Color color) => copyWith(
        shadowColor: WidgetStateProperty.all(color),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) {
            return states.contains(WidgetState.disabled)
                ? color.withOpacity(0.5)
                : color;
          },
        ),
      );

  ButtonStyle elevationSize(double elevation) {
    return copyWith(
      elevation: WidgetStateProperty.all(
        elevation,
      ),
    );
  }

  ButtonStyle paddingAll(double padding) {
    return copyWith(
      padding: WidgetStateProperty.all(
        EdgeInsets.all(padding),
      ),
    );
  }

  ButtonStyle paddingVertical(double padding) {
    return copyWith(
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(vertical: padding),
      ),
    );
  }

  ButtonStyle get removePaddings => copyWith(
        padding: WidgetStateProperty.all(
          EdgeInsets.zero,
        ),
      );

  ButtonStyle textColor(
    Color color,
  ) {
    return copyWith(
      foregroundColor: WidgetStateProperty.all(
        color,
      ),
    );
  }
}

// usage example: context.h3.regular.white
extension TextStyleHelpers on TextStyle {
  TextStyle get white => copyWith(color: AppColors.white);

  TextStyle get black => copyWith(color: AppColors.black);

  TextStyle get yellowLight => copyWith(color: AppColors.yellowLight);

  TextStyle get yellowDark => copyWith(color: AppColors.yellowDark);

  TextStyle get grayLight => copyWith(color: AppColors.greyLight);

  TextStyle get greyDark => copyWith(color: AppColors.greyDark);

  TextStyle get alertRed => copyWith(color: AppColors.alertRed);

  TextStyle get lightGreyText => copyWith(color: AppColors.lightGreyText);

  TextStyle get greyLight => copyWith(color: AppColors.greyLight);

  TextStyle size([double? fontSize]) => copyWith(fontSize: fontSize);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get regularItalic => copyWith(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      );

  TextStyle get mediumItalic => copyWith(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.italic,
      );

  TextStyle get semiBoldItalic => copyWith(
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.italic,
      );
}

extension GlobalKeyEx on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();

    return translation != null && renderObject?.paintBounds != null
        ? renderObject!.paintBounds.shift(Offset(translation.x, translation.y))
        : null;
  }
}
