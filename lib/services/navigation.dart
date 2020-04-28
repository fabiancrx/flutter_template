import 'package:flutter/widgets.dart';

/// Service to access the navigator without the need of the context.
/// Useful when modifying routes from outside of the widget tree.
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  NavigatorState get state => navigatorKey.currentState;
}
