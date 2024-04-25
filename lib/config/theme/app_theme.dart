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
      primary: ColorsManager.lightPrimaryColor,
      secondary: ColorsManager.detailsmovieColor
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30,
        color: ColorsManager.selectedTabColor,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.italic,
        fontFamily: "PlayfairDisplay"
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: "PlayfairDisplay"
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontFamily: "PlayfairDisplay"
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "PlayfairDisplay"

      ),
      titleLarge: TextStyle(
        fontFamily: "PlayfairDisplay",
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize:  18 ,
      ),
      //used in text form field
      labelSmall: TextStyle(
        color: ColorsManager.selectedTabColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: "PlayfairDisplay"
      ),
      titleSmall: TextStyle(
        fontFamily: "PlayfairDisplay",
        color: ColorsManager.movieDetailsTextColor,
        fontWeight: FontWeight.w400,
        fontSize:  18 ,
      ),

    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: ColorsManager.selectedTabColor,
        iconSize: 20,
      ),
      // for details screen




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