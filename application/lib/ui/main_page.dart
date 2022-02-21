import 'package:flutter/material.dart';
import 'package:xcem/models/repository.dart';
import 'package:xcem/ui/repo_view.dart';
import '../models/module.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xcem/utils/utils.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  List<Module> repoModules = <Module>[];
  late AppLocalizations locale;

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
        mainWidget = RepoView(repo: Repository.empty(), locale: locale);
        break;
      default:
        mainWidget = Text(locale.underConstruction);
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
              label: locale.donwloadedModules),
          BottomNavigationBarItem(
              icon: const Icon(Icons.create), label: locale.createdModules)
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
