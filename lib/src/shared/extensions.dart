import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/l10n.dart';

export 'package:supercharged/supercharged.dart';

///Used to trigger auto import and avoid
///[dart limitation of not importing extensions](https://github.com/dart-lang/sdk/issues/38894)

mixin ExtensionsMixin {}

/// Helper extension to set textstyle properties in a postfix manner
/// example `TextStyles.body.bold.italic.letterSpace(1.6)`
extension TextStyleX on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle color(Color color) => copyWith(color: color);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}

extension StringX on String {
  bool get isNotNullOrEmpty => this != null && isNotEmpty;

  bool get isNullOrEmpty => this == null || isEmpty;
}

extension NavigatorStateX<T> on NavigatorState {
  Future<T> removeAllAndPush<T>(Route<T> route) {
    while (canPop()) pop();
    return push<T>(route);
  }
}

extension DateTimeX on DateTime {
  String format(DateFormat format) {
    return format.format(this);
  }

  String formatYYYYMMdd() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}

extension BuildContextX on BuildContext {
  ThemeData get theme {
    return Theme.of(this);
  }

  Size get size {
    return mediaQuery.size;
  }

  MediaQueryData get mediaQuery {
    return MediaQuery.of(this);
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

extension AppLocalizationX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
