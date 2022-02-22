import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/module.dart';
import '../models/repository.dart';
import '../utils/utils.dart';

class RepoView extends StatelessWidget {
  final Repository repo;
  final AppLocalizations locale;
  final List<Module> repoModules = <Module>[
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
    Module.fake(),
  ];

  RepoView({Key? key, required this.repo, required this.locale})
      : super(key: key);

  //UI functions
  Widget getImage(Module module, double w, double h) {
    if (module.image == "") {
      return const SizedBox(width: 0, height: 0);
    } else {
      try {
        Image image = Image.memory(
          dataFromB64(module.image),
          fit: BoxFit.cover,
          width: w,
          height: h,
        );
        return Padding(padding: const EdgeInsets.all(2.0), child: image);
      } catch (e) {
        return SizedBox(width: w, height: h);
      }
    }
  }

  Widget getCard(Module module) {
    Widget image = getImage(module, 80, 80);
    return Card(
        color: Colors.green,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            image,
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(module.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8.0),
                        Text(locale.createdBy + " " + module.author)
                      ],
                    ))),
            IconButton(onPressed: () {}, icon: const Icon(Icons.download))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    double repoListHeight = mediaQuery.size.height - //window height
            mediaQuery.viewPadding.top -
            140 //remaining padding (includes bottomNavigation height)
        ;
    return Column(

        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
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
                    Text(locale.repositoryTitle,
                        style: const TextStyle(
                            fontSize: 32.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
            ],
          ),
          const SizedBox(height: 8.0),
          // SizedBox(
          //     height: repoListHeight,
          //     child: ListView.separated(
          //       padding: const EdgeInsets.all(0),
          //       itemCount: repoModules.length,
          //       scrollDirection: Axis.vertical,
          //       separatorBuilder: (BuildContext context, int index) =>
          //           Container(height: 0),
          //       itemBuilder: (BuildContext context, int index) {
          //         return getCard(repoModules[index]);
          //       },
          //     ))
          Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(0),
                itemCount: repoModules.length,
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(height: 0),
                itemBuilder: (BuildContext context, int index) {
                  return getCard(repoModules[index]);
                },
              ))
        ]);
  }
}
