import 'dart:convert';

import 'package:http/http.dart';
import 'package:xcem/models/application_version.dart';
import 'package:xcem/models/repository.dart';

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

Future<Repository> getRepoData() async{
  var json = await getJSON(Repository.repoUrl);
  return Repository.fromJSON(json);
}