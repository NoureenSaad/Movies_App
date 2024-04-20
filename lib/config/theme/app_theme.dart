import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.lightPrimaryColor,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w500
      ),
      actionsIconTheme: IconThemeData(
        color: ColorsManager.selectedTabColor,
        size: 24,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsManager.lightPrimaryColor,
      primary: ColorsManager.lightPrimaryColor
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        color: ColorsManager.selectedTabColor,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      //used in text form field
      labelSmall: TextStyle(
        color: ColorsManager.selectedTabColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: ColorsManager.selectedTabColor,
        iconSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.selectedTabColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      )
    )
  );
}