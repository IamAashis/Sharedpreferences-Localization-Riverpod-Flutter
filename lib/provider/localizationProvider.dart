import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/sharedUtilityProvider.dart';

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

  LocalizationNotifier({required this.ref}) : super(_locale(ENGLISH)) {
    state = ref.watch(sharedUtilityProvider).getLocaleNew();
  }

  void setLocalization(String s) {
    ref.watch(sharedUtilityProvider).setLocaleNew(s);
    state = ref.watch(sharedUtilityProvider).getLocaleNew();
  }
}

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