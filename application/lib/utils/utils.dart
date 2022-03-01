import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';
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


VersionChannel stringToVersionChannel(String channel){
  switch (channel) {
    case "stable": return VersionChannel.stable;
    case "beta": return VersionChannel.beta;
    case "dev": return VersionChannel.dev;
    default:return VersionChannel.stable;
  }
}