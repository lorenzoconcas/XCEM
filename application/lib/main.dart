import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:xcsem/ui/main_page.dart';

import 'data/Settings.dart';

Settings s = Settings();

void main() {

  s.initialize();
  MyApp app = const MyApp();
  runApp(
    Phoenix(
      child: app,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XCSEM',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
     // locale: const Locale("it", ""), //use it to force a language
      theme: ThemeData(
        brightness: s.darkMode! ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.green,
      ),
      home: MainPage(settings: s),
    );
  }
}
