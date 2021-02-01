import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExt on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  FocusScopeNode get focusScope {
    return FocusScope.of(this);
  }

  NavigatorState get navigator {
    return Navigator.of(this);
  }

  ScaffoldState get scaffold {
    return Scaffold.of(this);
  }

  T args<T>() {
    return ModalRoute.of(this).settings.arguments as T;
  }
}
