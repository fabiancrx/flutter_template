import 'package:flutter/widgets.dart';

extension NavigationExtras on NavigatorState {
  Future<T> removeAllAndPush<T>(Route<T> route) {
    while (this.canPop()) this.pop();
    return this.push<T>(route);
  }
}