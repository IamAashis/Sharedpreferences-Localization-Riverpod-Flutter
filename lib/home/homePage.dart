import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sharedpreferences_riverpod_flutter/model/Language.dart';
import '../navigator.dart';
import '../provider/localizationProvider.dart';
import '../utils/LocalizationUtils.dart';

/**
 * Created by Aashis on 10,January,2024
 */

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Localization'),
        actions: <Widget>[
          IconButton(
            onPressed: () => AppNavigator().navToSettingsPage(context),
            icon: const Icon(Icons.settings),
          ),
          Padding(
            padding: EdgeInsets.only(left: 0, right: 4.0, top: 0, bottom: 0),
            child: DropdownButton<Language>(
              underline: SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.black,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  ref
                      .read(isLocalizationProvider.notifier)
                      .setLocalization(language.languageCode);
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(translation(context).language),
          ),
        ],
      ),
      body: Container(child: _homeBody(context)),
    );
  }
}

Center _homeBody(BuildContext context) {
  return Center(
    child: Text(translation(context).language),
  );
}
