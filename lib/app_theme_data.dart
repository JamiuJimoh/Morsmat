import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Color(0xFF47F5F5);
  static const Color _subtitleTextColor = Color(0xFFABACAF);

  // static const Color _whiteColor = Color(0xFFFFFFFF);
  static const Color _lightSurfaceColor = Color(0xFF323335);
  static const Color _lightOnSurfaceColor = Color(0xFFD0D1D3);
  static const Color _errorColor = Color(0xFFF9AA33);
  static const Color _onErrorColor = _lightSurfaceColor;

  static const Color _lightPrimaryColor = Color(0xFFFAFBFF);
  static const Color _lightPrimaryVariantColor = Color(0xFFF5F6Fa);
  static const Color _lightOnPrimaryColor = _lightSurfaceColor;
  static const Color _lightSecondaryColor = Color(0xFFF54748);
  static const Color _lightSecondaryVariantColor = Color(0xFF121315);
  static const Color _lightOnSecondaryColor = _lightPrimaryColor;

  static final ThemeData primaryAppTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _lightSecondaryColor,
      secondaryVariant: _lightSecondaryVariantColor,
      onSecondary: _lightOnSecondaryColor,
      surface: _lightSurfaceColor,
      onSurface: _lightOnSurfaceColor,
      error: _errorColor,
      onError: _onErrorColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    accentColor: _lightSecondaryColor,
    // primaryColor: _lightPrimaryColor,

    appBarTheme: AppBarTheme(
      color: _lightPrimaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: _lightPrimaryVariantColor,
        statusBarColor: _lightPrimaryVariantColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: _lightOnPrimaryColor,
      ),
    ),
    scaffoldBackgroundColor: _lightPrimaryColor,

    dialogTheme: DialogTheme(
      titleTextStyle: _lightBody1TextStyle,
      contentTextStyle: _lightBody2TextStyle,
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: _lightBody2TextStyle,
      labelStyle: _lightBody2TextStyle,
      filled: true,
      fillColor: _lightPrimaryVariantColor,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightSecondaryVariantColor),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: _lightPrimaryVariantColor),
      ),
    ),

    buttonTheme: ButtonThemeData(disabledColor: _subtitleTextColor),

    /////// FONT THEME ///////
    textTheme: _lightTextTheme,
    fontFamily: 'Poppins',
  );

  static final TextTheme _lightTextTheme = TextTheme(
    headline1: _lightHeadLine1TextStyle,
    headline2: _lightHeadLine2TextStyle,
    bodyText1: _lightBody1TextStyle,
    bodyText2: _lightBody2TextStyle,
    subtitle1: _lightSubtitleTextStyle,
  );

  static final TextStyle _lightHeadLine1TextStyle = TextStyle(
    fontSize: 30.0,
    color: _lightOnPrimaryColor,
  );

  static final TextStyle _lightHeadLine2TextStyle = TextStyle(
    fontSize: 25.0,
    color: _lightOnPrimaryColor,
  );
  static final TextStyle _lightBody1TextStyle = TextStyle(
    fontSize: 18.0,
    color: _lightOnPrimaryColor,
  );
  static final TextStyle _lightBody2TextStyle = TextStyle(
    fontSize: 15.0,
    color: _lightOnPrimaryColor,
  );
  static final TextStyle _lightSubtitleTextStyle = TextStyle(
    fontSize: 10.0,
    color: _subtitleTextColor,
  );
}
