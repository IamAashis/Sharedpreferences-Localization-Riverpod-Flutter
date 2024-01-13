import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharedpreferences_riverpod_flutter/model/Language.dart';
import '../navigator.dart';

/**
 * Created by Aashis on 10,January,2024
 */

final counterProvider = StateProvider((ref) => 0);

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
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if(language != null){
                  Locale locale = await setLocale(language.languageCode);
                }
              },
            ),
          )
        ],
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, _) {
            final count = ref.watch(counterProvider.state).state;
            return Text('$count');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.state).state++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
