import 'package:flutter/widgets.dart';

extension NavigatorStateX<T> on NavigatorState {
  Future<T> removeAllAndPush<T>(Route<T> route) {
    while (canPop()) pop();
    return push<T>(route);
  }
}
