import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.lightPrimaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.lightPrimaryColor,
      primary: ColorsManager.lightPrimaryColor
    )
  );
}