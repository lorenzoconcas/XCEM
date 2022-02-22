import '../utils/utils.dart';

class Triple<T1, T2, T3> {
  final T1 a;
  final T2 b;
  final T3 c;

  Triple(this.a, this.b, this.c);
}

class Repository {
  static String repoDataUrl =
      "https://lorenzoconcas.github.io/XCSEM/repo/repo.json";
  static String repoModulesUrl =
      "https://lorenzoconcas.github.io/XCSEM/repo/modules/";
  String lastUpdate;

  //module name, module url, image in base64
  List<Triple<String, String, String>> availableModules;

  Repository(this.lastUpdate, this.availableModules);

  Repository.fromJSON(dynamic json)
      : lastUpdate = json["lastUpdate"],
        availableModules = safe(
            (json["modules"] as List)
                .map((e) =>
                Triple<String, String, String>(
                    e["name"], e["url"], e["image"]))
                .toList(),
            <Triple<String, String, String>>[]);

  Repository.empty()
      :
        lastUpdate = DateTime.now().toIso8601String(),
        availableModules = <Triple<String, String, String>>[];
}
