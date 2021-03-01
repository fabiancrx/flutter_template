import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/l10n/l10n.dart';
import 'package:template/src/app/service_locator.dart';
import 'package:template/src/app/services/navigation.dart';
import 'package:template/src/app/services/theme.dart';

import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appThemeState = service<AppThemeState>();

    return StreamBuilder<ThemeData>(
        stream: appThemeState.theme,
        builder: (context, snapshot) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            theme: snapshot.data,
            navigatorKey: service<Navigation>().navigatorKey,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routes: AppRoutes().routes,
            initialRoute: '/',
          );
        });
  }
}
