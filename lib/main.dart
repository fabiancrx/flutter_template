import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/service.dart';
import 'package:template/services/navigation.dart';
import 'package:template/ui/screens/Home.dart';
import 'package:template/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject services [ inject.dart ]
  await inject();
  // Force portrait mode

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(
      MaterialApp(
        navigatorKey: service<NavigationService>().navigatorKey,
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
