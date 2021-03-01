import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app/app.dart';
import 'src/app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inject services [ inject.dart ]
  await inject();
  // Force portrait mode
  await SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // Use dart zone to log errors that occur outside runApp(replace with Crashlytics if you want)
  runZonedGuarded(
    () => runApp(const RootRestorationScope(restorationId: 'root', child: App())),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
