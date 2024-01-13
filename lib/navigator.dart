import 'package:flutter/material.dart';
import 'package:sharedpreferences_riverpod_flutter/routes.dart';

class AppNavigator {
  factory AppNavigator() {
    return _instance;
  }

  AppNavigator._();

  static final AppNavigator _instance = AppNavigator._();

  void pop(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }

  void navToSettingsPage(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.settingsPage);
  }
}
