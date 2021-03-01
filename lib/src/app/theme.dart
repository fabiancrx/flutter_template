import 'package:flutter/material.dart';

//TODO find a more generic/comfortable class to inject
class CustomTheme {
  Color bg;
  final Color primary;
  final bool isDark;

  /// Default constructor
  CustomTheme({this.isDark = false, @required this.primary, this.bg}) {
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
