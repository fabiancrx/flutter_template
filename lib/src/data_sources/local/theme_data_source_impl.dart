//
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:template/src/shared/contracts/i_local_storage.dart';
//
// import 'theme_data_source.dart';
//
// class ThemeDataSourceImpl extends ThemeDataSource {
//   ThemeDataSourceImpl({@required LocalStorage localStorage}) : _localStorage = localStorage;
//
//   static const String KEY_THEME_SETTING = 'theme_setting';
//
//   final LocalStorage _localStorage;
//
//   @override
//   ThemeSetting loadThemeSetting() {
//     return EnumToString.fromString(
//         ThemeSetting.values, _localStorage.get<String>(KEY_THEME_SETTING));
//   }
//
//   @override
//   Future<void> saveThemeSetting(ThemeSetting theme) {
//     return _localStorage.set<String>(KEY_THEME_SETTING, EnumToString.parse(theme));
//   }
// }
