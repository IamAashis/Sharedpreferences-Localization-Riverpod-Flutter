import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/localizationProvider.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/sharedUtilityProvider.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/themeProvider.dart';
import 'package:sharedpreferences_riverpod_flutter/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.amber,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: Colors.amber,
  brightness: Brightness.dark,
);
Locale? _locale;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences)
  ], child: const SampleApp()));
}

class SampleApp extends ConsumerWidget {
  const SampleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);
    print("Rebuilding with watched locale: " + isDark.toString());
    Locale _locale = ref.watch(isLocalizationProvider);
    print("Rebuilding with watched locale: " + _locale.toString());

    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: Routes.routes,
      locale: _locale,
      debugShowCheckedModeBanner: false,
    );
  }
}
