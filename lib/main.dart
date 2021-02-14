import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/configuration/service_locator.dart';
import 'src/core/services/navigation.dart';
import 'src/core/services/theme.dart';
import 'src/shared/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject services [ inject.dart ]
  await inject();
  // Force portrait mode
  final appThemeState = AppThemeState(lightTheme: AppTheme(isDark: false, primary: Colors.purple).themeData, darkTheme: AppTheme2.darkTheme);

  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(
      StreamBuilder<ThemeData>(
          stream: appThemeState.theme,
          builder: (context, snapshot) {
            return MaterialApp(
              navigatorKey: service<Navigation>().navigatorKey,
              title: 'Flutter template',
              themeMode: ThemeMode.light,
              theme: snapshot.data,
              home: Scaffold(
                appBar: AppBar(title: const Text('Template', maxLines: 2)),
                body: const Center(child: FlutterLogo(size: 69)),
              ),
            );
          }),
    ),
  );
}
