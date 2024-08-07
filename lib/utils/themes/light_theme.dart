import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yellowDark),
  primaryColor: AppColors.yellowLight,
  scaffoldBackgroundColor: AppColors.white,
  canvasColor: AppColors.white,
  sliderTheme: const SliderThemeData(
    trackHeight: 1,
    thumbColor: AppColors.white,
    activeTrackColor: AppColors.yellowDark,
    inactiveTrackColor: AppColors.borderColor,
    rangeThumbShape: RoundRangeSliderThumbShape(
      enabledThumbRadius: 12,
      disabledThumbRadius: 12,
      pressedElevation: 20,
      elevation: 3,
    ),
  ),
  switchTheme: SwitchThemeData(
    trackOutlineColor: WidgetStateProperty.all(AppColors.borderColor),
    trackOutlineWidth: WidgetStateProperty.all(0),

  ),
  buttonTheme: const ButtonThemeData(buttonColor: Colors.red),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: AppColors.white,
  ),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: AppColors.white,
    iconTheme: IconThemeData(color: AppColors.white),
  ),
);
