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
  bool prebuiltAvailable;
  String prebuiltArchivePath;
  List<ModuleFiles> files;

  Module(this.name, this.image, this.prebuiltAvailable,
      this.prebuiltArchivePath, this.files);

  Module.fromJSON(dynamic json)
      : name = Safe(json["name"], ""),
        image = Safe(json["image"], ""),
        prebuiltArchivePath = Safe(json["prebuiltAvailable"], ""),
        prebuiltAvailable = Safe(json["prebuiltArchivePath"], ""),
        files = Safe((json["files"] as List)
            .map((e) => ModuleFiles.fromJSON(e))
            .toList(), <ModuleFiles>[])
  ;

}