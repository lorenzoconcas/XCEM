import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';

import 'package:path_provider/path_provider.dart';
import 'package:xcsem/models/application_version.dart';

dynamic safe(dynamic value, dynamic safeValue) => value ?? safeValue;

Image imageFromB64(String b64) {
  return Image.memory(base64Decode(b64));
}

Uint8List dataFromB64(String b64) {
  return base64Decode(b64);
}

String base64String(Uint8List data) {
  return base64Encode(data);
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> getFile(String filename) async {
  final path = await _localPath;
  return File('$path/$filename');
}

Future<File> saveFile(String filename, Uint8List data) async {
  final file = await getFile(filename);

  // Write the file
  return file.writeAsBytes(data);
}

Future<File> saveString(String filename, String data) async {
  final file = await getFile(filename);

  // Write the file
  return file.writeAsString(data);
}

Future<String> readFileAsString(String filename) async {
  try {
    final file = await getFile(filename);

    // Read the file
    return await file.readAsString();
  } catch (e) {
    // If encountering an error, return 0
    return "";
  }
}

Future<dynamic> readJSON(String filename) async {
  var json = await readFileAsString(filename);
  return jsonDecode(json);
}

Future<File> saveJSON(String filename, Object json) async {
  var str = jsonEncode(json);
  return saveString(filename, str);
}


VersionChannel stringToVersionChannel(String channel){
  switch (channel) {
    case "stable": return VersionChannel.stable;
    case "beta": return VersionChannel.beta;
    case "dev": return VersionChannel.dev;
    default:return VersionChannel.stable;
  }
}