import 'package:shared_preferences/shared_preferences.dart';

// Getters
Future<String> loadSavedStringPref(String prefKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefKey) ?? "";
}

Future<bool?> loadSaveBoolPref(String prefKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool(prefKey);
}

// Setters
Future<void> setStringPref(String prefKey, String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(prefKey, value);
}

Future<void> setBoolPref(String prefKey, bool value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(prefKey, value);
}

// deleters

Future<void> deleteValue(String prefKey) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(prefKey);
}
