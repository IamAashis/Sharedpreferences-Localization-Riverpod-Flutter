import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharedpreferences_riverpod_flutter/main.dart';
import 'package:sharedpreferences_riverpod_flutter/model/Language.dart';
import '../navigator.dart';
import '../utils/languageConstants.dart';

/**
 * Created by Aashis on 10,January,2024
 */

/*final counterProvider = StateProvider((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
        actions: <Widget>[
          IconButton(
            onPressed: () => AppNavigator().navToSettingsPage(context),
            icon: const Icon(Icons.settings),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.black,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  SampleApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, _) {
              final count = ref.watch(counterProvider.state).state;
              return Text('$count');
            },
          ),
          _homeBody(context)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}

Column _homeBody(BuildContext context) {
  return Column(
    children: [Text(translation(context).personalInformation)],
  );
}*/

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter example'),
        actions: <Widget>[
          IconButton(
            onPressed: () => AppNavigator().navToSettingsPage(context),
            icon: const Icon(Icons.settings),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.black,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  // SampleApp.setLocale(context, _locale);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
      body: Column(
        children: [_homeBody(context)],
      ),
    );
  }
}

Column _homeBody(BuildContext context) {
  return Column(
    children: [Text(translation(context).personalInformation)],
  );
}
