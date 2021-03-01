import 'package:flutter/material.dart';
import 'package:template/gen/assets.gen.dart';
import 'package:template/src/app/services/theme.dart';

import '../../gen/assets.gen.dart';
import 'theme.dart';

var s = R.fonts.style.title;

/// Class that holds reference to app configurations and constants.
///
//The naming mimics Android's R class 😉
/// This class should hold only contain instances of other classes which in turn
/// will hold the app constants such as assets, themes, strings(not i18n) etc.
///Every classed contained here is meant to centralize constants and avoid runtime errors
///```
/// Text(R.str.website);
/// ```
class R {
  const R._();

  static _LocalStorageKey get localStorageKey => const _LocalStorageKey._();

  static $AssetsImagesGen get image => Assets.images;

  static _Strings get str => const _Strings._();

  static _Dimensions get dimen => const _Dimensions._();

  static _Themes get theme => const _Themes._();

  static _Raw get raw => const _Raw._();

  static _Fonts get fonts => const _Fonts._();
}

/// Holds raw file assets path's such as json,databases or binary data
class _Raw {
  const _Raw._();
}

/// Holds the themes used throughout the app
class _Themes {
  const _Themes._();

  ThemeData get defaultLightTheme => CustomTheme(primary: Colors.blue).themeData;

  AppThemeState get appTheme => AppThemeState(
        lightTheme: R.theme.defaultLightTheme,
        darkTheme: R.theme.defaultDarkTheme,
      );

  ThemeData get defaultDarkTheme => CustomTheme(primary: Colors.lightBlueAccent, isDark: true).themeData;
}

///Contains the keys used in local Storage
///
///For example shared_preferences, hive or secure_storage among others
class _LocalStorageKey {
  const _LocalStorageKey._();

  String get isFirstUse => 'first_use';
  String get theme => 'selected_theme';
  String get locale => 'selected_locale';

}

///Holds strings that are used in your app and are not suitable for i18n
class _Strings {
  const _Strings._();

  String get website => 'https://www.example.com/';
}

///Holds common sizes fot icons or images
class _Dimensions {
  const _Dimensions._();

  _FontSizes get fontSize => const _FontSizes._();

  //SIZES
  double get iconSizeSM => 24.0;

  double get iconSizeM => 28.0;
}

///Holds the name of the fonts that the app uses
class _Fonts {
  const _Fonts._();

  TextStyles get style => const TextStyles._();

  String get body => 'Lato';

  String get title => 'Roboto';
}

class _FontSizes {
  const _FontSizes._();

  static const double scale = 1;

  double get body => 14 * scale;

  double get bodySm => 12 * scale;

  double get title => 16 * scale;
}

class TextStyles {
  const TextStyles._();

  TextStyle get bodyFont => TextStyle(fontFamily: const _Fonts._().body);

  TextStyle get titleFont => TextStyle(fontFamily: const _Fonts._().title);

  TextStyle get title => titleFont.copyWith(fontSize: const _FontSizes._().title);

  TextStyle get titleLight => title.copyWith(fontWeight: FontWeight.w300);

  TextStyle get body => bodyFont.copyWith(fontSize: const _FontSizes._().body, fontWeight: FontWeight.w300);

  TextStyle get bodySm => body.copyWith(fontSize: const _FontSizes._().bodySm);
}
