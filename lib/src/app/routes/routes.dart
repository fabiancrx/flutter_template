import 'package:flutter/material.dart';
import 'package:template/src/features/home/home.screen.dart';

class AppRoutes {
  Map<String, WidgetBuilder> _routes;

  AppRoutes([Map<String, WidgetBuilder> additionalRoutes]) {
    _routes = {
      '/': (ctx) => const Home(),
      if (additionalRoutes != null) ...additionalRoutes,
    };
  }

  Map<String, WidgetBuilder> get routes => _routes;
}
