import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:xcsem/models/application_version.dart';

import '../data/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../utils/utils.dart';

class SettingsPage extends StatelessWidget {
  final AppLocalizations locale;
  final Settings settings;

  const SettingsPage({Key? key, required this.locale, required this.settings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    locale.applicationName,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                  Text(locale.settings,
                      style: const TextStyle(
                          fontSize: 32.0, fontWeight: FontWeight.bold)),
                  Text(locale.settings_page_subtitle),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        const SizedBox(height: 12.0),
        const Divider(),
        Row(
          children: [
            Switch(
              onChanged: (bool value) {
                settings.darkMode = value;
                settings.save();
                Phoenix.rebirth(context);
              },
              value: safe(settings.darkMode, true),
            ),
            Text(locale.useDarkMode)
          ],
        ),
        const Divider(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children:[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButton<String>(
                  value: settings.updateChannel.name,
                  elevation: 10,
                  underline: Container(
                    height: 2,
                    color: settings.accent,
                  ),
                  onChanged: (String? newValue) {},
                  items: VersionChannel.values
                      .map<DropdownMenuItem<String>>((VersionChannel value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList()),
            ),
            Text(locale.updateChannel),
            ]),
            TextButton(onPressed: (){}, child: Text(locale.checkUpdates))
          ],
        ),
        const Divider(),
      ],
    );
  }
}
