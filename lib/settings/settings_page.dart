import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:sharedpreferences_riverpod_flutter/provider/themeProvider.dart';

/**
 * Created by Aashis on 10,January,2024
 */

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: SafeArea(
          child: SettingsList(sections: [
        SettingsSection(tiles: [
          SettingsTile.switchTile(
              leading: const Icon(Icons.dark_mode),
              initialValue: ref.watch(isDarkProvider),
              description: ref.watch(isDarkProvider)
                  ? Text('Dark mode enabled')
                  : Text('Dark mode disabled'),
              onToggle: (_) {
                ref.read(isDarkProvider.notifier).toggleTheme();
              },
              title: Text('Dark mode')),
        ])
      ])),
    );
  }
}
