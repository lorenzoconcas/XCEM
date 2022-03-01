import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xcsem/main.dart';
import 'package:xcsem/models/module.dart';
import 'package:xcsem/tools/magisk.dart';
import 'package:xcsem/tools/network.dart';

void main() {
  test("Test repo data retrieving", () async {
    var repo = await getRepoData();
    assert(repo.availableModules.length == 1);
    assert(repo.lastUpdate.isUtc);
  });
}
