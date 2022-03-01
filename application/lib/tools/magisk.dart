import 'package:xcsem/models/module.dart';

/*
 * Magisk Module reference :
 * https://topjohnwu.github.io/Magisk/guides.html
 * */

/*
* All magisk-related code si here :
* manifest generation, zip archive creation ecc
* */

String createManifest(ModuleDescriptor module) {
  //id has to match ^[a-zA-Z][a-zA-Z0-9._-]+$
  var id = "xcsem_module_${module.name.hashCode}";
  return "id=$id\n"
      "name=${module.name}\n"
      "version=${module.version}\n"
      "versionCode=1\n"
      "author=${module.author}\n"
      "description=${module.description}\n"
      "updateJson=";
}

//TO-DO
/*
* This functions checks if all files are present locally,
* if some are missing, then it will try to download them
* when all resources are ready they get copied in the
* work-folder which name is the module name hash (integrated with the lang)
* */

void prepareFiles(ModuleDescriptor module) {}
//TO-DO
/*
* Simply zips the folder at the given path (workFolder)
* */
void createModuleArchive(String workFolder) {}
