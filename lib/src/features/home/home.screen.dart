import 'package:flutter/material.dart';
import 'package:template/src/app/service_locator.dart';
import 'package:template/src/app/services/theme.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context?.l10n?.notACounterAppBarTitle??'', maxLines: 2)),
      body: Center(
        child: ThemSwitch(),
      ),
    );
  }
}

class ThemSwitch extends StatelessWidget {
  final appThemeState = service<AppThemeState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
      stream: appThemeState.theme,
      builder: (context, snapshot) {
        return Switch.adaptive(
          value: appThemeState.isDark,
          onChanged: (toggled) => appThemeState.toggleTheme(),
        );
      }
    );
  }
}
