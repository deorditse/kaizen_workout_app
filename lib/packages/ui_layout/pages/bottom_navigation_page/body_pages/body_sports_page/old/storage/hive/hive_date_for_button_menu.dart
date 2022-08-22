import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DataHiveForButtonMenu {
  static Future<void> saveDataHiveForButtonMenulist(
      List<String> listMenuNamed) async {
    var boxListMenuNamed = await Hive.openBox('boxMenu');
    await boxListMenuNamed.put("listMenuNamed", listMenuNamed);
    print("  OF saveDataHiveForButtonMenulist  $listMenuNamed"); ////////
  }

  static Future<List<String>> getDataHiveForButtonMenuList() async {
    var boxListMenuNamed = await Hive.openBox('boxMenu');

    var result = await boxListMenuNamed.get("listMenuNamed");

    print("OF getDataHiveForButtonMenuList  $result"); ////////

    return result; //result;
  }

// static Future<void> removeDataHiveForButtonMenuList() async {
//   var boxListMenuNamed = await Hive.openBox('boxMenu');
//   await boxListMenuNamed.delete("listMenuNamed");
//   print("OF removeDataHiveForButtonMenuList"); ////////
// }
}
