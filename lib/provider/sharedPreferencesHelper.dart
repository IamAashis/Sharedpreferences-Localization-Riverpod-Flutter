import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_riverpod_flutter/utils/constants/sharedPreferencesConstants.dart';

import '../utils/LocalizationUtils.dart';

/**
 * Created by Aashis on 10,January,2024
 */
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
    sharedPreferencesHelper.setString(LANGUAGECODE, languageCode);
    return locale(languageCode);
  }

  Locale getLocaleNew() {
    String languageCode =
        sharedPreferencesHelper.getString(LANGUAGECODE) ?? ENGLISH;
    return locale(languageCode);
  }
}
