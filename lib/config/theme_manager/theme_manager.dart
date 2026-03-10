import 'package:flutter/material.dart';
import 'package:islami_app/core/colors_manager.dart';

class ThemeManager {
  static ThemeData light = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      foregroundColor: ColorsManager.gold,
      centerTitle: true,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorsManager.gold),

    ),
    scaffoldBackgroundColor: ColorsManager.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.gold,
      selectedItemColor: ColorsManager.white,
      unselectedItemColor: ColorsManager.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
    inputDecorationTheme: InputDecorationTheme(
     prefixIconColor: ColorsManager.gold,
    labelStyle: TextStyle(color: ColorsManager.ofwhite, fontSize: 16, fontWeight: FontWeight.bold),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsManager.gold,width: 1),
      borderRadius: BorderRadius.circular(16)
    ),
      focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ColorsManager.gold,width: 1),
      borderRadius: BorderRadius.circular(16)
    ),

    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: ColorsManager.gold),
    bodyMedium:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: ColorsManager.gold),
    
      titleLarge:  TextStyle(color: ColorsManager.black , fontSize: 24, fontWeight: FontWeight.bold),
            titleSmall:  TextStyle(color: ColorsManager.black , fontSize: 14, fontWeight: FontWeight.w500),
titleMedium: TextStyle(color: ColorsManager.ofwhite , fontSize: 16, fontWeight: FontWeight.bold),
      labelSmall: TextStyle(color: ColorsManager.ofwhite , fontSize: 16, fontWeight: FontWeight.bold),
      labelMedium: TextStyle(color: ColorsManager.ofwhite, fontSize: 14, fontWeight: FontWeight.w500)
,
    labelLarge: TextStyle(color: ColorsManager.ofwhite , fontSize: 20, fontWeight: FontWeight.bold)

    
    ),

  );
  static ThemeData dark = ThemeData();
}
