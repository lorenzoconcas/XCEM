import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:xcsem/tools/network.dart';
import '../models/module.dart';
import '../models/repository.dart';
import '../utils/utils.dart';

class RepoView extends StatefulWidget {
  AppLocalizations locale;

  RepoView({Key? key, required this.locale}) : super(key: key);

  @override
  State<RepoView> createState() => _RepoViewState();
}

class _RepoViewState extends State<RepoView> {
  late Repository repo = Repository.empty();
  late AppLocalizations locale;

  @override
  void initState() {
    super.initState();
    locale = widget.locale;
    _loadRepoData();
  }

  _loadRepoData() async {
    repo = await getRepoData();
    setState(() {
      repo = repo;
    });

    print("done");
    print(repo.availableModules);
  }

  //UI functions
  Widget getImage(String img, double w, double h) {
    if (img == "") {
      return const SizedBox(width: 0, height: 0);
    } else {
      try {
        Image image = Image.memory(
          dataFromB64(img),
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

  Widget getCard(RepoModule module) {
    Widget image = getImage(module.image, 80, 80);
    return Card(
        color: Colors.green,
        child: InkWell(
            onTap: () {
              _openModuleDetails(module);
            },
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8.0),
                            Text(locale.createdBy + " " + module.name)
                          ],
                        ))),
                IconButton(onPressed: () {}, icon: const Icon(Icons.download))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    //var mediaQuery = MediaQuery.of(context);
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
              IconButton(
                  onPressed: () {
                    _loadRepoData();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          const SizedBox(height: 8.0),
          Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: repo.availableModules.length,
            scrollDirection: Axis.vertical,
            separatorBuilder: (BuildContext context, int index) =>
                Container(height: 0),
            itemBuilder: (BuildContext context, int index) {
              return getCard(repo.availableModules[index]);
            },
          ))
        ]);
  }

  void _openModuleDetails(RepoModule module) {}
}
