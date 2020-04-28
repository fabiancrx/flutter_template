import 'package:flutter/material.dart';

class AppTheme {
  Color bg = Colors.tealAccent;
  Color primary;
  bool isDark = false;

  /// Default constructor
  AppTheme({@required this.isDark, @required this.primary, this.bg = Colors.white});

  ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    TextTheme txtTheme = (isDark ? ThemeData.dark() : ThemeData.light()).textTheme;
    Color txtColor = Color(0xff181818);
    ColorScheme colorScheme = ColorScheme(
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
    var t = ThemeData.from(
      textTheme: txtTheme,
      colorScheme: colorScheme,
    )
        // We can also add on some extra properties that ColorScheme seems to miss
        .copyWith(
            buttonColor: primary,
            cursorColor: primary,
            highlightColor: primary,
            toggleableActiveColor: primary,
            primaryColor: primary);

    /// Return the themeData which MaterialApp can now use
    return t;
  }
}
