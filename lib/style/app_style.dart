import 'package:flutter/material.dart';

class AppStyle {
  static const Color categoriesTitleColor = Color(0xff4F5A69);
  static const Color lightBlackText = Color(0xff303030);
  static const Color lightPrimary = Color(0xff39A552);
  static ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          headlineMedium: TextStyle(
              color: categoriesTitleColor,
              fontWeight: FontWeight.w700,
              fontSize: 22),
          headlineLarge: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: ColorScheme.fromSeed(
          seedColor: lightPrimary,
          primary: lightPrimary,
          secondary: lightBlackText),
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          backgroundColor: lightPrimary,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
          centerTitle: true));
}
