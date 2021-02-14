import 'package:flutter/material.dart';

// Transparency list
// 100% FF
// 95%  F2
// 90%  E6
// 87%  DE
// 85%  D9
// 80%  CC
// 75%  BF
// 70%  B3
// 65%  A6
// 60%  99
// 55%  8C
// 54%  8A
// 50%  80
// 45%  73
// 40%  66
// 35%  59
// 32%  52
// 30%  4D
// 26%  42
// 25%  40
// 20%  33
// 16%  29
// 15%  26
// 12%  1F
// 10%  1A
// 5%   0D
// 0%   00
class AppTheme {
  Color bg;
  Color primary;
  bool isDark = false;

  /// Default constructor
  AppTheme({this.isDark = false, @required this.primary, this.bg}) {
    if (bg == null) {
      if (isDark) {
        bg = const Color(0xff282c30);
      } else {
        bg = Colors.white;
      }
    }
  }

  ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    final txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    const txtColor = Color(0xff181818);
    final colorScheme = ColorScheme(
        // Decide how you want to apply your own custom them, to the MaterialApp
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        primaryVariant: primary,
        secondary: primary,
        secondaryVariant: primary,
        background: bg,
        surface: bg,
        onBackground: txtColor,
        onSurface: txtColor,
        onError: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red.shade400);

    /// Now that we have ColorScheme and TextTheme, we can create the ThemeData
    final t = ThemeData.from(
      textTheme: txtTheme,
      colorScheme: colorScheme,
    )
        // We can also add on some extra properties that ColorScheme seems to miss
        .copyWith(buttonColor: primary, highlightColor: primary, toggleableActiveColor: primary, primaryColor: primary);

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}

class AppTheme2 {
  AppTheme2._();

  static final Color _iconColor = Colors.blueAccent.shade200;

  static const Color _lightPrimaryColor = Colors.white;
  static const Color _lightPrimaryVariantColor = Color(0XFFE1E1E1);
  static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Colors.black;

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _lightPrimaryVariantColor,
    appBarTheme: const AppBarTheme(
      color: _lightPrimaryVariantColor,
      iconTheme: IconThemeData(color: _lightOnPrimaryColor),
    ),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightPrimaryVariantColor,
      secondary: _lightSecondaryColor,
      onPrimary: _lightOnPrimaryColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: _darkPrimaryVariantColor,
    appBarTheme: const AppBarTheme(
      color: _darkPrimaryVariantColor,
      iconTheme: IconThemeData(color: _darkOnPrimaryColor),
    ),
    colorScheme: const ColorScheme.light(
      primary: _darkPrimaryColor,
      primaryVariant: _darkPrimaryVariantColor,
      secondary: _darkSecondaryColor,
      onPrimary: _darkOnPrimaryColor,
    ),
    iconTheme: IconThemeData(
      color: _iconColor,
    ),
    textTheme: _darkTextTheme,
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline6: _lightScreenHeadingTextStyle,
    bodyText2: _lightScreenTaskNameTextStyle,
    bodyText1: _lightScreenTaskDurationTextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline6: _darkScreenHeadingTextStyle,
    bodyText1: _darkScreenTaskNameTextStyle,
    bodyText2: _darkScreenTaskDurationTextStyle,
  );

  static const TextStyle _lightScreenHeadingTextStyle = TextStyle(fontSize: 48.0, color: _lightOnPrimaryColor);
  static const TextStyle _lightScreenTaskNameTextStyle = TextStyle(fontSize: 20.0, color: _lightOnPrimaryColor);
  static const TextStyle _lightScreenTaskDurationTextStyle = TextStyle(fontSize: 16.0, color: Colors.grey);

  static final TextStyle _darkScreenHeadingTextStyle =
      _lightScreenHeadingTextStyle.copyWith(color: _darkOnPrimaryColor);

  static final TextStyle _darkScreenTaskNameTextStyle =
      _lightScreenTaskNameTextStyle.copyWith(color: _darkOnPrimaryColor);

  static const TextStyle _darkScreenTaskDurationTextStyle = _lightScreenTaskDurationTextStyle;
}
