import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/sharedUtilityProvider.dart';

import '../utils/LocalizationUtils.dart';
import '../utils/constants/sharedPreferencesConstants.dart';

/**
 * Created by Aashis on 14,January,2024
 */
final isLocalizationProvider =
    StateNotifierProvider<LocalizationNotifier, Locale>((ref) {
  return LocalizationNotifier(ref: ref);
});

class LocalizationNotifier extends StateNotifier<Locale> {
  Ref ref;

  // Locale(ENGLISH sending  default value of english in first
  LocalizationNotifier({required this.ref}) : super(locale(ENGLISH)) {
    state = ref.watch(sharedUtilityProvider).getLocaleNew();
  }

  void setLocalization(String s) {
    ref.watch(sharedUtilityProvider).setLocaleNew(s);
    state = ref.watch(sharedUtilityProvider).getLocaleNew();
  }
}
