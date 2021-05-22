import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static Color _iconColor = Color(0xFF47F5F5);
  static const Color _subtitleTextColor = Color(0xFFABACAF);
  static const Color _errorColor = Color(0xFFF9AA33);
  static const Color _onErrorColor = Color(0xFF323335);
  static const Color _secondaryColor = Color(0xFFF54748);
  static const Color _secondaryVariantColor = Color(0xFFEB252A);

  ///// LIGHT THEME COLORS ///////

  static const Color _lightPrimaryColor = Color(0xFFFAFBFF);
  static const Color _lightOnPrimaryColor = Color(0xFF323335);
  static const Color _lightPrimaryVariantColor = Color(0xFFF0F1F5);
  static const Color _lightOnSecondaryColor = Color(0xFFFAFBFF);
  static const Color _lightSurfaceColor = Color(0xFF323335);
  static const Color _lightOnSurfaceColor = Color(0xFFD0D1D3);

  ///// DARK THEME COLORS ///////

  // static const Color _darkPrimaryColor = Color(0xFF323335);
  // static const Color _darkPrimaryVariantColor = Color(0xFF636466);
  // static const Color _darkOnPrimaryColor = Color(0xFFFAFBFF);
  // static const Color _darkOnSecondaryColor = Color(0xFFFAFBFF);
  // static const Color _darkSurfaceColor = Color(0xFF8A8B8E);
  // static const Color _darkOnSurfaceColor = Color(0xFFFAFBFF);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      onPrimary: _lightOnPrimaryColor,
      secondary: _secondaryColor,
      secondaryVariant: _secondaryVariantColor,
      onSecondary: _lightOnSecondaryColor,
      surface: _lightSurfaceColor,
      onSurface: _lightOnSurfaceColor,
      error: _errorColor,
      onError: _onErrorColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    accentColor: _secondaryColor,
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

    primaryIconTheme: IconThemeData(color: _iconColor),

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
    fontFamily: 'Merienda',
    fontWeight: FontWeight.normal,
    color: _lightOnPrimaryColor,
  );

  static final TextStyle _lightHeadLine2TextStyle = TextStyle(
    fontSize: 25.0,
    fontFamily: 'Merienda',
    fontWeight: FontWeight.normal,
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
    fontSize: 13.0,
    color: _subtitleTextColor,
  );

  ////// DARK THEME ////////

  // static final ThemeData darkTheme = ThemeData(
  //   colorScheme: ColorScheme.dark(
  //     primary: _darkPrimaryColor,
  //     primaryVariant: _darkPrimaryVariantColor,
  //     onPrimary: _darkOnPrimaryColor,
  //     secondary: _secondaryColor,
  //     secondaryVariant: _secondaryVariantColor,
  //     onSecondary: _darkOnSecondaryColor,
  //     surface: _darkSurfaceColor,
  //     onSurface: _darkOnSurfaceColor,
  //     error: _errorColor,
  //     onError: _onErrorColor,
  //   ),
  //   iconTheme: IconThemeData(
  //     color: _iconColor,
  //   ),
  //   accentColor: _secondaryColor,
  //   // primaryColor: _lightPrimaryColor,

  //   appBarTheme: AppBarTheme(
  //     color: _darkPrimaryColor,
  //     systemOverlayStyle: SystemUiOverlayStyle(
  //       systemNavigationBarColor: _darkPrimaryVariantColor,
  //       statusBarColor: _darkPrimaryVariantColor,
  //       systemNavigationBarIconBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.light,
  //     ),
  //     elevation: 0.0,
  //     iconTheme: IconThemeData(
  //       color: _darkOnPrimaryColor,
  //     ),
  //   ),
  //   scaffoldBackgroundColor: _darkPrimaryColor,

  //   dialogTheme: DialogTheme(
  //     titleTextStyle: _lightBody1TextStyle,
  //     contentTextStyle: _lightBody2TextStyle,
  //   ),

  //   primaryIconTheme: IconThemeData(color: _iconColor),
  //   accentIconTheme: IconThemeData(color: _iconColor),

  //   /////// FONT THEME ///////
  //   textTheme: _darkTextTheme,
  //   fontFamily: 'Poppins',
  // );

  // static final TextTheme _darkTextTheme = TextTheme(
  //   headline1: _darkHeadLine1TextStyle,
  //   headline2: _darkHeadLine2TextStyle,
  //   bodyText1: _darkBody1TextStyle,
  //   bodyText2: _darkBody2TextStyle,
  //   subtitle1: _darkSubtitleTextStyle,
  // );

  // static final TextStyle _darkHeadLine1TextStyle = TextStyle(
  //   fontSize: 30.0,
  //   color: _darkOnPrimaryColor,
  // );

  // static final TextStyle _darkHeadLine2TextStyle = TextStyle(
  //   fontSize: 25.0,
  //   color: _darkOnPrimaryColor,
  // );
  // static final TextStyle _darkBody1TextStyle = TextStyle(
  //   fontSize: 18.0,
  //   color: _darkOnPrimaryColor,
  // );
  // static final TextStyle _darkBody2TextStyle = TextStyle(
  //   fontSize: 15.0,
  //   color: _darkOnPrimaryColor,
  // );
  // static final TextStyle _darkSubtitleTextStyle = TextStyle(
  //   fontSize: 10.0,
  //   color: _subtitleTextColor,
  // );
}
