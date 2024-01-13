import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/sharedPreferencesHelper.dart';

/**
 * Created by Aashis on 10,January,2024
 */

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedPreferencesHelper>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesHelper(sharedPreferencesHelper: sharedPreferences);
});
