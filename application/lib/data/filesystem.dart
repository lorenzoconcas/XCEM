import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory);
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

/*
* The purpose of this function is to assure there are
* required folder to store modules and other informations
* */

bool checkAndCreate() {return false;}
