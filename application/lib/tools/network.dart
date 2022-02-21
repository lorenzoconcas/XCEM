import 'dart:convert';

import 'package:http/http.dart';
import 'package:xcem/models/application_version.dart';
import 'package:xcem/models/repository.dart';

import '../models/module.dart';

Future<Response> getData(String url) async {
  Response r = await get(Uri.parse(url));
  return r;
}

dynamic getJSON(String url) async {
  Response r = await getData(url);
  return jsonDecode(r.body);
}

Future<ApplicationVersion> getVersionData(VersionChannel channel) async {
  var json = await getJSON(appDataUrl);
  return ApplicationVersion.fromJSON(channel, json);
}

Future<Repository> getRepoData() async {
  var json = await getJSON(Repository.repoDataUrl);
  return Repository.fromJSON(json);
}

Future<List<Module>> getModules(Repository repo) async {
  List<Module> modules = <Module>[];
  for (var element in repo.availableModules) {
    var moduleUrl = Repository.repoModulesUrl + element.b + "/module.json";
    var json = await getJSON(moduleUrl);
    modules.add(Module.fromJSON(json));
  }

  return modules;
}
