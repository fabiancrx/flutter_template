import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/src/core/utils/theme.dart';
import 'package:template/src/service_locator.dart';
import 'package:template/src/services/navigation.dart';

import 'package:template/src/views/screens/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject services [ inject.dart ]
  await inject();
  // Force portrait mode

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(
      MaterialApp(
        navigatorKey: service<Navigation>().navigatorKey,
        title: 'Flutter template',
        themeMode: ThemeMode.light,
        theme: AppTheme(
          isDark: false,
          primary: Colors.deepPurpleAccent,
        ).themeData,
        home: Home(),
      ),
    ),
  );
}
