import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:template/src/screens/home.dart';
import 'package:template/src/app/services/navigation.dart';

import 'src/service_locator.dart';
import 'src/shared/utils/theme.dart';

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
