import 'package:flutter/material.dart';
import 'package:xcsem/models/repository.dart';
import 'package:xcsem/tools/network.dart';
import 'package:xcsem/ui/info_page.dart';
import 'package:xcsem/ui/repo_view.dart';
import 'package:xcsem/ui/settings_page.dart';
import 'package:xcsem/ui/test_page.dart';
import '../data/Settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.settings}) : super(key: key);
  final Settings settings;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  late AppLocalizations locale;
  late Settings settings;


  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    locale = AppLocalizations.of(context)!;
    var mediaQuery = MediaQuery.of(context);
    /*
    * this the content of the selected page, we write it here
    *  because switch case inside Widget is not allowed at the moment
    * of writing
    */
    Widget? mainWidget;
    switch (currentPage) {
      case 0:
        mainWidget = RepoView(locale: locale);
        break;
      case 3:
        mainWidget = SettingsPage(locale: locale, settings: settings);
        break;
      case 4:
        mainWidget = InfoPage(locale: locale);
        break;
      default:
        mainWidget = const TestPage();
    }
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(
              left: 8.0, right: 8.0, top: mediaQuery.viewPadding.top + 8.0),
          child: mainWidget),
      floatingActionButton: currentPage == 2
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: locale.fabTooltip,
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.blueGrey,
        onTap: (int page) {
          setState(() {
            currentPage = page;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: locale.home),
          BottomNavigationBarItem(
              icon: const Icon(Icons.download),
              label: locale.downloadedModules),
          // BottomNavigationBarItem(
          //     icon: const Icon(Icons.system_update_alt_sharp),
          //     label: locale.availableModuleUpdates),
          BottomNavigationBarItem(
              icon: const Icon(Icons.create), label: locale.createdModules),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: locale.settings),
          BottomNavigationBarItem(
              icon: const Icon(Icons.info), label: locale.info),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
