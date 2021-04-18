import 'package:bmi_checker/src/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      primaryColor: Colors.grey[850],
      accentColor: gradientStartColor,
      primaryColorLight: gradientStartColor,
      canvasColor: gradientStartColor,
      focusColor: gradientStartColor,
      textTheme: TextTheme(
          headline1: kbmiCheckSplashTextStyle,
          bodyText1: kBodyText1,
          bodyText2: kBodyText1.copyWith(fontSize: 20)),
      appBarTheme: AppBarTheme(
        color: Colors.grey[850],
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      primaryColor: Colors.grey[850],
      appBarTheme: AppBarTheme(
        color: Colors.white,
        titleTextStyle: TextStyle(fontSize: 24, color: Colors.grey[850]),
      ),
      accentColor: gradientStartColor,
      primaryColorLight: gradientStartColor,
      canvasColor: gradientStartColor,
    );
  }
}
