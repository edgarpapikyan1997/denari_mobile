import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.yellowDark),
  primaryColor: AppColors.yellowLight,
  scaffoldBackgroundColor: AppColors.white,
  canvasColor: AppColors.white,
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
