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
      :
        filename = Safe(json["fileName"], ""),
        replacePath = Safe(json["replacePath"], ""),
        srcMimetype = Safe(json["srcMimetype"], ""),
        destMimetype = Safe(json["destMimetype"], ""),
        srcExtension = Safe(json["srcExtension"], ""),
        destExtension = Safe(json["destExtension"], "")
  ;
}

class Module {
  String name;
  String image; //png base64
  String author;
  bool prebuiltAvailable;
  String prebuiltArchivePath;
  List<ModuleFiles> files;

  Module(this.name, this.author, this.image, this.prebuiltAvailable,
      this.prebuiltArchivePath, this.files);

  Module.fromJSON(dynamic json)
      : name = Safe(json["name"], ""),
        author = Safe(json["author"], ""),
        image = Safe(json["image"], ""),
        prebuiltArchivePath = Safe(json["prebuiltArchivePath"], ""),
        prebuiltAvailable = Safe(json["prebuiltAvailable"], false) as bool,
        files = Safe((json["files"] as List)
            .map((e) => ModuleFiles.fromJSON(e))
            .toList(), <ModuleFiles>[])
  ;

  @override
  String toString() {
    return "Module name $name created by $author";
  }

}