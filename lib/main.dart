import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/localizationProvider.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/sharedUtilityProvider.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/themeProvider.dart';
import 'package:sharedpreferences_riverpod_flutter/routes.dart';
import 'package:sharedpreferences_riverpod_flutter/utils/languageConstants.dart';
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
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      //   ...AppLocalizations.localizationsDelegates
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: [Locale('ja', 'JP')],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routes: Routes.routes,
      locale: _locale,
      debugShowCheckedModeBanner: false,
    );
  }

  /*static void setLocale(BuildContext context, Locale newLocale) {
    _SampleAppState? state = context.findAncestorStateOfType<_SampleAppState>();
    state?.setLocale(newLocale);
  }*/
}

/*class _SampleAppState extends ConsumerState<SampleApp> {

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

/*void main() {
  runApp(const MyApp());
}*/
/*
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: Routes.routes,
      locale: _locale,
    );
  }
}*/

/*class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: *//*isDark ? ThemeMode.dark :*//* ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: Routes.routes,
      locale: _locale,
    );
  }
}*/
