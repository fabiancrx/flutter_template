import 'package:flutter/widgets.dart';

/// Service to access the navigator without the need of the context.
/// Useful when modifying routes from outside of the widget tree.
class Navigation {
  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();

  NavigatorState get state => navigatorKey.currentState;
}
