import 'package:flutter/material.dart';
import 'constants.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData primaryAppTheme = ThemeData(
    accentColor: kAccentColor,
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kScaffoldColor,
    appBarTheme: AppBarTheme(
      backgroundColor: kScaffoldColor,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: kPrimaryColor,),
      bodyText2: TextStyle(color: kPrimaryColor),
    ),
    fontFamily: 'Poppins',
  );
}
