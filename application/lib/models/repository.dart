import '../utils/utils.dart';

class Triple<T1, T2, T3> {
  final T1 a;
  final T2 b;
  final T3 c;

  Triple(this.a, this.b, this.c);
}

class Repository {
  static String repoUrl =
      "https://lorenzoconcas.github.io/xiaomi_camera_effects_manager/repo/repo.json";
  String lastUpdate;
  List<Triple<String, String, String>> availableModules;

  Repository(this.lastUpdate, this.availableModules);

  Repository.fromJSON(dynamic json)
      : lastUpdate = json["lastUpdate"],
        availableModules = Safe((json["modules"] as List)
            .map((e) =>
                Triple<String, String, String>(e["name"], e["url"], e["image"]))
            .toList(), <Triple<String,String, String>>[]);
}
