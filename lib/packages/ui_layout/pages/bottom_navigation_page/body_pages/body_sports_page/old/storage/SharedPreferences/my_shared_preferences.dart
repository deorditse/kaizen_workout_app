import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/storage/services.dart';
import '../../pages/Test_calendars_page/controller/calendar_page_controller.dart';
import '../hive/hive_date_for_button_menu.dart';

TableBasicsController myListPageController = Get.find<TableBasicsController>();

class SaveSharedPrefObject {
  /// //save data
  static Future<void> saveSelectedIndex(selectIndex) async {
    await Services.sharedPrefs.setInt("saveSelectedIndex", selectIndex);
  }

  static Future<void> saveTextFieldUp(keyPage, String textFieldUp) async {
    await Services.sharedPrefs.setString("textFieldUp $keyPage", textFieldUp);
  }

  static Future<void> saveTextFieldDown(keyPage, String textFieldDown) async {
    await Services.sharedPrefs
        .setString("textFieldDown $keyPage", textFieldDown);
  }

  static Future<void> saveStatisticsFromSelectDaysFromCalendars(
      keyPage, selectDaysLength) async {
    await Services.sharedPrefs.setInt(
        "StatisticsFromSelectDaysFromCalendars¬ $keyPage", selectDaysLength);
  }

  ///  //GET My Shared Preference
  static Future<int>? getSelectedIndex() async {
    return await Services.sharedPrefs.getInt("saveSelectedIndex") ?? 0;
  }

  static Future<String>? getTextFieldUp(keyPage) async {
    return await Services.sharedPrefs.getString("textFieldUp $keyPage") ??
        await DataHiveForButtonMenu.getDataHiveForButtonMenuList().then(
            (value) => value[myListPageController.indexMyArrayBody.value]);
  }

  static Future<String>? getTextFieldDown(keyPage) async {
    return await Services.sharedPrefs.getString("textFieldDown $keyPage") ??
        await DataHiveForButtonMenu.getDataHiveForButtonMenuList().then((value) =>
            "${value[myListPageController.indexMyArrayBody.value]} - нажмите,чтобы дополнить");
  }

  static Future<int>? getStatisticsFromSelectDaysFromCalendars(keyPage) async {
    return await Services.sharedPrefs
            .getInt("StatisticsFromSelectDaysFromCalendars¬ $keyPage") ??
        0;
  }

  /// //Remove Object From My List
  static void removeTextFieldUp(keyPage) {
    Services.sharedPrefs.remove("textFieldUp $keyPage");
  }

  static void removeTextFieldDown(keyPage) {
    Services.sharedPrefs.remove("textFieldDown $keyPage");
  }

  static void removeStatisticsFromSelectDaysFromCalendars(keyPage) {
    Services.sharedPrefs
        .remove("StatisticsFromSelectDaysFromCalendars¬ $keyPage");
  }

// static Future<void> removeBottomLengthListForBuildButtonMenu() async {
//   await Services.sharedPrefs.remove("BottomLengthListForBuild");
// }

  ///
//
// Future<int>? getBottomLengthListForBuild() async {
//   return await Services.sharedPrefs.getInt("BottomLengthListForBuild") ?? 1;
// }
}
