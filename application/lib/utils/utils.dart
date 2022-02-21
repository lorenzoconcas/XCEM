import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/widgets.dart';


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