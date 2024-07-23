import 'package:flutter/material.dart';
import 'app_colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.black),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    color: AppColors.white,
    iconTheme: IconThemeData(color: Colors.white),
  ),
);

