import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.lightPrimaryColor,
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
      titleLarge: TextStyle(
        fontFamily: 'inter',
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize:  18 ,
      ),
      // for details screen
      titleSmall: TextStyle(
        fontFamily: 'inter',
        color: ColorsManager.movieDetailsTextColor,
        fontWeight: FontWeight.w400,
        fontSize:  18 ,
      ),



    ),
  );
}