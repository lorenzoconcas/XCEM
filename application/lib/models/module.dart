import '../utils/utils.dart';

/*
* This class represents the files inside the ModuleDetails (obv.)
* */
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

/*
* This represents the module descriptor (the file named module.json in the module folder)
* It's separated from the RepoModule with the purpose of generate less network traffic to the server
* */

class ModuleDescriptor {
  String name;
  String? image; //png base64
  String? author;
  DateTime? lastUpdated;
  String? description;
  String? version;
  List<ModuleFiles> files;

  ModuleDescriptor(this.name, this.files,
      {this.author = "",
      this.image = "",
      this.lastUpdated,
      this.description = ""});

  ModuleDescriptor.fromJSON(dynamic json)
      : name = safe(json["name"], ""),
        author = safe(json["author"], ""),
        image = safe(json["image"], ""),
        description = safe(json["description"], ""),
        version = safe(json["version"], "1.0"),
        lastUpdated = safe(
            DateTime.parse(json["lastUpdated"]), DateTime(2021, 1, 1).toUtc()),
        files = safe(
            (json["files"] as List)
                .map((e) => ModuleFiles.fromJSON(e))
                .toList(),
            <ModuleFiles>[]);

  ModuleDescriptor.fake()
      : name = "Example Module",
        author = "Example author",
        image = "",
        version = "1.0",
        description = "Example description",
        lastUpdated = DateTime.now().toUtc(),
        files = <ModuleFiles>[];

  @override
  String toString() {
    return "\nModule Descriptor contains this data : \n"
        "\tname $name\n"
        "\tauthor $author\n"
        "\tversion $version\n"
        "\timage is present ${image == ""}\n"
        "\tlast updated on $lastUpdated\n"
        "\tcontains ${files.length} files";
  }
}

/*
* Corresponds to the item in the module object in repo.json
* */
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

  @override
  String toString() {
    return "Module name $name created by $author";
  }
}

/*
* There is a tool written in javascript (NodeJS) that make and update the repo.json file
* */
