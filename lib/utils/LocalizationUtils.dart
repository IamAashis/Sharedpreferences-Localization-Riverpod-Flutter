import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'constants/sharedPreferencesConstants.dart';

/**
 * Created by Aashis on 14,January,2024
 */
AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}

Locale locale(String languageCode) {
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
