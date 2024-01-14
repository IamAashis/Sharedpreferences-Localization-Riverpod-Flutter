import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_riverpod_flutter/utils/constants/sharedPreferencesConstants.dart';

/**
 * Created by Aashis on 10,January,2024
 */

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, '');
    case FARSHI:
      return const Locale(FARSHI, '');
    case ARABIC:
      return const Locale(ARABIC, '');
    case HINDI:
      return const Locale(HINDI, '');
    default:
      return const Locale(ENGLISH, '');
  }
}

class SharedPreferencesHelper {
  final SharedPreferences sharedPreferencesHelper;

  SharedPreferencesHelper({required this.sharedPreferencesHelper});

  bool isDarkModeEnabled() {
    return sharedPreferencesHelper.getBool(sharedDarkModeKey) ?? false;
  }

  void setDarkModeEnabled({required bool isDarkTheme}) {
    sharedPreferencesHelper.setBool(sharedDarkModeKey, isDarkTheme);
  }

  Locale setLocaleNew(String languageCode) {
    // SharedPreferences _prefs = await SharedPreferences.getInstance();
    sharedPreferencesHelper.setString(LANGUAGECODE, languageCode);
    return _locale(languageCode);
  }

  Locale getLocaleNew() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = sharedPreferencesHelper.getString(LANGUAGECODE) ?? ENGLISH;
    return _locale(languageCode);
  }
}
