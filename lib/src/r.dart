import 'package:template/gen/assets.gen.dart';

/// Class that holds reference to app configurations and constants.
/// The naming mimics Android's R class 😉
/// This class should hold only instances of other classes which in turn
/// will hold the app constants such as assets, themes, strings(not i18n) etc.
class R {
  const R._();

  static LocalStorageKeys get localStorageKeys => LocalStorageKeys();

  static $AssetsImagesGen get images => Assets.images;

  static $Strings get str => $Strings();

  static $Dimens get size => $Dimens();

// static Fonts get fonts => Fonts();
// static Theme get theme => Theme();
}

class LocalStorageKeys {}

class $Strings {
  const $Strings();

}

class $Dimens {
  const $Dimens();

  static double get scale => 1;

  double get s11 => 11 * scale;

  double get s12 => 12 * scale;

  double get s14 => 14 * scale;

  double get s16 => 16 * scale;

  double get s18 => 18 * scale;

  double get s22 => 22 * scale;

  ///SIZES
  double get iconSizeSM => 24.0;

  double get iconSizeM => 28.0;

}

class Fonts {
  static const String lato = "Lato";

  static const String quicksand = "Quicksand";

  static const String emoji = "OpenSansEmoji";
}

class PageBreaks {
  static double get LargePhone => 550;

  static double get TabletPortrait => 768;

  static double get TabletLandscape => 1024;

  static double get Desktop => 1440;
}
// class Theme{};
