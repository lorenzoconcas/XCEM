import 'package:flutter/material.dart';
import 'package:xcsem/models/application_version.dart';
import 'package:xcsem/utils/utils.dart';

class Settings {
  static const settingsFileName = "settings.json";
  bool? darkMode = true;
  Color? accent = Colors.green;
  bool initialized = false;
  VersionChannel updateChannel = VersionChannel.dev;

  Settings();

  save() {
    saveJSON(settingsFileName, toJson());
  }

  Future<bool> load() async {
    var json = await readJSON(settingsFileName);
    darkMode = json['darkMode'];
    accent = json['accent'];
    updateChannel = json['updateChannel'];
    initialized = true;
    return true;
  }

  Settings.fromJSON(dynamic json)
      : darkMode = json['darkMode'],
        accent = Color(json['accent']),
        updateChannel = stringToVersionChannel(json['updateChannel']),
        initialized = true;

  Map<String, dynamic> toJson() {
    return {
      "darkMode": darkMode,
      "accent": accent?.value,
      "updateChannel": updateChannel.name,
    };
  }

  /*
  * this function tries to read saved settings and load them,
  * if no file is found or something goes wrong then it loads default settings
  */
  initialize() async {
    try {
      return load();
    } finally {
      initialized = true;
      save();
    }
  }


}
