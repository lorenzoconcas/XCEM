import 'package:xcsem/models/module.dart';

import '../utils/utils.dart';

/*
* Corresponds to repo.json
* */

class Repository {
  static String repoDataUrl =
      "https://lorenzoconcas.github.io/XCSEM/repo/repo.json";
  static String repoModulesUrl =
      "https://lorenzoconcas.github.io/XCSEM/repo/modules/";
  DateTime lastUpdate; //ISO 8601 UTC

  //module name, module url, image in base64
  List<RepoModule> availableModules;

  Repository(this.lastUpdate, this.availableModules);

  Repository.fromJSON(dynamic json)
      : lastUpdate = safe(DateTime.parse(json["lastUpdate"]),
            DateTime.now().toUtc()),
        availableModules = safe(
            (json["modules"] as List)
                .map((e) => RepoModule.fromJSON(e))
                .toList(),
            <RepoModule>[]);

  Repository.empty()
      : lastUpdate = DateTime.now(),
        availableModules = <RepoModule>[];
}
