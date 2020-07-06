/// Class that holds reference to app configurations and constants.
//The naming mimics Android's R class 😉
/// This class should hold only instances of other classes which in turn
/// will hold the app constants such as assets, themes, strings(not i18n) etc.
class R {
  const R._();

  static LocalStorageKeys get localStorageKeys => LocalStorageKeys();
  static Assets get assets => Assets();
  static Strings get str => Strings();
  static Fonts get fonts => Fonts();
  static Theme get theme => Theme();
}

class Assets {}

class LocalStorageKeys {}

class Strings {}

class Fonts {}

class Theme {}
