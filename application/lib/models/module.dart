import '../utils/utils.dart';

class ModuleFiles {
  String filename;
  String replacePath;
  String srcMimetype;
  String destMimetype;
  String srcExtension;
  String destExtension;

  ModuleFiles(this.filename, this.replacePath, this.srcExtension,
      this.srcMimetype, this.destExtension, this.destMimetype);

  ModuleFiles.fromJSON(dynamic json)
      : filename = safe(json["fileName"], ""),
        replacePath = safe(json["replacePath"], ""),
        srcMimetype = safe(json["srcMimetype"], ""),
        destMimetype = safe(json["destMimetype"], ""),
        srcExtension = safe(json["srcExtension"], ""),
        destExtension = safe(json["destExtension"], "");
}

class Module {
  String name;
  String image; //png base64
  String author;
  bool prebuiltAvailable;
  String prebuiltArchivePath;
  String lastUpdated; //ISO 8601
  List<ModuleFiles> files;

  Module(this.name, this.author, this.image, this.prebuiltAvailable,
      this.prebuiltArchivePath, this.lastUpdated, this.files);

  Module.fromJSON(dynamic json)
      : name = safe(json["name"], ""),
        author = safe(json["author"], ""),
        image = safe(json["image"], ""),
        lastUpdated =
            safe(json["image"], DateTime(2021, 1, 1).toIso8601String()),
        prebuiltArchivePath = safe(json["prebuiltArchivePath"], ""),
        prebuiltAvailable = safe(json["prebuiltAvailable"], false) as bool,
        files = safe(
            (json["files"] as List)
                .map((e) => ModuleFiles.fromJSON(e))
                .toList(),
            <ModuleFiles>[]);

  Module.fake()
      : name = "Example Module",
        author = "Example author",
        image = "",
        lastUpdated = DateTime.now().toIso8601String(),
        prebuiltAvailable = false,
        prebuiltArchivePath = "",
        files = <ModuleFiles>[];

  @override
  String toString() {
    return "Module name $name created by $author";
  }
}

class RepoModule {
  String name;
  String url;
  String author;
  String image;

  RepoModule(this.name, this.author, this.url, this.image);

  RepoModule.fromJSON(dynamic json)
      : name = safe(json["name"], ""),
        url = safe(json["url"], ""),
        author = safe(json["author"], ""),
        image = safe(json["image"], "");

  RepoModule.fake()
      : name = safe("Example name", ""),
        url = safe("example url", ""),
        author = safe("Example author", ""),
        image = "";
}
