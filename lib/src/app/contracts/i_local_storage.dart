import 'package:shared_preferences/shared_preferences.dart';

var sp = SharedPreferences.getInstance();

abstract class LocalStorage {
  T get<T>(String key);

  Future<bool> set<T>(String key, T value);

  Future<bool> clear();

  bool contains(String key);

  Future<bool> remove(String key);
}

class SharedPreferencesLocalStorage implements LocalStorage {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesLocalStorage(this._sharedPreferences);

  @override
  Future<bool> clear() => _sharedPreferences.clear();

  @override
  bool contains(String key) => _sharedPreferences.containsKey(key);

  @override
  T get<T>(String key) => _sharedPreferences.get(key) as T;

  @override
  Future<bool> remove(String key) => _sharedPreferences.remove(key);

  @override
  Future<bool> set<T>(String key, T value) {
    if (T is bool) {
      return _sharedPreferences.setBool(key, value as bool);
    } else if (T is String) {
      return _sharedPreferences.setString(key, value as String);
    } else if (T is double) {
      return _sharedPreferences.setDouble(key, value as double);
    } else if (T is List<String>) {
      return _sharedPreferences.setStringList(key, value as List<String>);
    } else if (T is int) {
      return _sharedPreferences.setInt(key, value as int);
    } else {
      return _sharedPreferences.setString(key, T.toString());
    }
  }
}
