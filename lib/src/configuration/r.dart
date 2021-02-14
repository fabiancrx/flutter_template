import 'package:template/gen/assets.gen.dart';
import 'package:template/src/shared/utils/text_styles.dart';

import '../../gen/assets.gen.dart';
import 'package:flutter/material.dart';

/// Class that holds reference to app configurations and constants.
//The naming mimics Android's R class 😉
/// This class should hold only instances of other classes which in turn
/// will hold the app constants such as assets, themes, strings(not i18n) etc.
class R {
  const R._();

  static LocalStorageKey get localStorageKey => LocalStorageKey();

  static $AssetsImagesGen get images => Assets.images;

  static $Strings get str => const $Strings();

  static $Dimens get size => const $Dimens();
}

class LocalStorageKey {}

class $Strings {
  const $Strings();

  String get website => "https://www.example.com/";
}

class $Dimens {
  const $Dimens();

  FontSizes get font => FontSizes();

  ///SIZES
  double get iconSizeSM => 24.0;

  double get iconSizeM => 28.0;
}

// class Fonts {}

// class Theme {}
const colorChips = [
  Color(0xf0dd4e4e),
  Color(0xf0db4f7a),
  Color(0xf0854fdb),
  Color(0xf0594fdb),
  Color(0xf04f8fdb),
  Color(0xf04fdba5),
  Color(0xf04fdb70),
  Color(0xf075db4f),
  Color(0xf0dbd84f),
  Color(0xf0d87750),
];

Color deterministicChipColor(String name) {
  return colorChips[name.hashCode % colorChips.length];
}
