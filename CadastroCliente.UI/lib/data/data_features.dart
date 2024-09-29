import 'package:shared_preferences/shared_preferences.dart';

class DataFeatures {
  static String get keyDataClient => "";

  static SharedPreferences? _prefs;

  static Future _initialize() async =>
      _prefs ??= await SharedPreferences.getInstance();

  static Future insert({required String strObject, required String key}) async {
    await _initialize();

    await _prefs!.setString(key, strObject);
  }

  static Future<String?> get({required String key}) async {
    await _initialize();

    return _prefs!.getString(key);
  }
}
