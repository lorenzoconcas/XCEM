import 'package:xcsem/models/module.dart';

import '../utils/utils.dart';

class Repository {
  static String repoDataUrl =
      "https://lorenzoconcas.github.io/XCSEM/repo/repo.json";
  static String repoModulesUrl =
      "https://lorenzoconcas.github.io/XCSEM/repo/modules/";
  String lastUpdate;

  //module name, module url, image in base64
  List<RepoModule> availableModules;

  Repository(this.lastUpdate, this.availableModules);

  Repository.fromJSON(dynamic json)
      : lastUpdate = json["lastUpdate"],
        availableModules = safe(
            (json["modules"] as List)
                .map((e) => RepoModule.fromJSON(e))
                .toList(),
            <RepoModule>[]);

  Repository.empty()
      : lastUpdate = DateTime.now().toIso8601String(),
        availableModules = <RepoModule>[];
}
