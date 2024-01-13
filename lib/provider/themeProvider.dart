import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/sharedUtilityProvider.dart';

/**
 * Created by Aashis on 10,January,2024
 */

final isDarkProvider = StateNotifierProvider<DarkThemeNotifier, bool>((ref) {
  return DarkThemeNotifier(ref: ref);
});

class DarkThemeNotifier extends StateNotifier<bool> {
  Ref ref;

  DarkThemeNotifier({required this.ref}) : super(true) {
    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
  }

  void toggleTheme() {
    ref.watch(sharedUtilityProvider).setDarkModeEnabled(
          isDarkTheme: !ref.watch(sharedUtilityProvider).isDarkModeEnabled(),
        );

    state = ref.watch(sharedUtilityProvider).isDarkModeEnabled();
  }
}
