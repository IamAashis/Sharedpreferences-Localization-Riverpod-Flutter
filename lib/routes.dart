import 'package:flutter/material.dart';
import 'package:sharedpreferences_riverpod_flutter/settings/settings_page.dart';

import 'home/homePage.dart';

/**
 * Created by Aashis on 10,January,2024
 */
abstract class Routes {
  static const home = '/';
  static const settingsPage = '/settingsPage';

  static Map<String, WidgetBuilder> routes = {
    settingsPage: (_) => const SettingsPage(),
    home: (_) => const HomePage(),
  };
}
