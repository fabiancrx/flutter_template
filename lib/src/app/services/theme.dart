import 'dart:async';

import 'package:flutter/material.dart';

class AppThemeState {
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final StreamController<ThemeData> _currentTheme = StreamController.broadcast();
  bool _isDark = false;

  Stream<ThemeData> get theme => _currentTheme.stream;

  bool get isDark => _isDark;

  AppThemeState({@required this.lightTheme, @required this.darkTheme, bool isDark}) {
    _currentTheme.sink.add(lightTheme);
    if (isDark != null) {
      _isDark = isDark;
    }
  }

  void toggleTheme() {
    if (isDark) {
      _currentTheme.sink.add(lightTheme);
    } else {
      _currentTheme.sink.add(darkTheme);
    }
    _isDark = !_isDark;
  }
}