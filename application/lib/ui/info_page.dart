import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatelessWidget {
  final AppLocalizations locale;

  const InfoPage({Key? key, required this.locale}) : super(key: key);

  Widget xdaBtn() {
    return Card(
        child: Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  try {
                    launch(
                        "https://forum.xda-developers.com/t/magisk-mod-app-collection-2020-feb-11-popup-sound-effects-collection.3982993/");
                  } catch (e) {}
                },
                splashColor: const Color(0x3E424CFF),
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(27, 29, 33, 1),
                      boxShadow: const [
                        BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.08))
                      ]),
                  child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/xda_logo.png", width: 16)),
                ))),
        Text(locale.comment_on_xda)
      ],
    ));
  }

  Widget githubBtn() {
    return Card(
        child: Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: FloatingActionButton(
              splashColor: Colors.white,
              mini: true,
              onPressed: () {
                try {
                  launch("https://github.com/lorenzoconcas/XCSEM");
                } catch (e) {}
              },
              backgroundColor: Colors.black,
              child: const Icon(FontAwesomeIcons.github, color: Colors.white),
            )),
        Text(locale.see_on_github)
      ],
    ));
  }

  Widget projectPageBtn() {
    return Card(
        child: Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: FloatingActionButton(
              splashColor: Colors.white,
              mini: true,
              onPressed: () {
                try {
                  launch("https://lorenzoconcas.github.io/XCSEM");
                } catch (e) {}
              },
              backgroundColor: Colors.black,
              child: const Icon(FontAwesomeIcons.github, color: Colors.white),
            )),
        const Text("Visit project page")
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Center(
        child: Column(
      children: [
        Image.asset(
          "assets/icon.png",
          width: mediaQuery.size.width / 2,
          height: mediaQuery.size.width / 2,
        ),
        const SizedBox(height: 8.0),
        Text(locale.applicationTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8.0),
        projectPageBtn(),
        githubBtn(),
        xdaBtn(),
        const Expanded(child: Text("")),
        const Divider(),
        Text(locale.madeInSardinia),
        const SizedBox(height: 12.0)
      ],
    ));
  }
}
