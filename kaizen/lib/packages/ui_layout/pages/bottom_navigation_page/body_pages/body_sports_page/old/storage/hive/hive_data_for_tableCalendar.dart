import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../pages/Test_calendars_page/utils.dart';

//Тут буду сохранять только данные table calendar и все что с ним связано
// 1 по индексу страницы буду обращаться к данным календаря чтобы перестраивать каждый раз календарь при переходе на новую страницу
//для этого начну с того чт

class DataFromHiveForTableCalendar {

  static Future<void> saveDataFromHiveForTableCalendar(
      int indexPage, List<dynamic> myListSelectedDays) async {
    var boxSelectedDays = await Hive.openBox('DataFromHive $indexPage');
    await boxSelectedDays.put("indexPage $indexPage", myListSelectedDays);
    print(
        " printprintprintprint OF saveDataFromHive  $myListSelectedDays"); ////////
  }

  static Future<void> savekFirstDayListCalendar(
      List<dynamic> kFirstDayList) async {
    var BOXkFirstDayList = await Hive.openBox('BOXkFirstDayList');
    await BOXkFirstDayList.put("myListkFirstDay", kFirstDayList);
    print(
        " savekFirstDayListCalendar OF myListkFirstDay $kFirstDayList"); ////////
  }

  static Future<List> getDataFromHiveForTableCalendar(int indexPage) async {
    var boxSelectedDays = await Hive.openBox('DataFromHive $indexPage');

    var result = await boxSelectedDays.get("indexPage $indexPage") ?? [];

    //boxSelectedDays.close();
    print("printprintprintprintprint OF getDataFromHive  $result"); ////////

    return result;
  }

  static Future<List> getkFirstDayListCalendar() async {
    var BOXkFirstDayList = await Hive.openBox('BOXkFirstDayList');

    var result = await BOXkFirstDayList.get("myListkFirstDay") ??
        [DateTime(kToday.year, kToday.month - 1, kToday.day)];

    //boxSelectedDays.close();
    print("myListkFirstDay OF getDataFromHive  $result"); ////////

    return result;
  }

  static Future<void> removeDataFromHiveForTableCalendar(int indexPage) async {
    var boxSelectedDays = await Hive.openBox('DataFromHive $indexPage');
    await boxSelectedDays.delete("indexPage $indexPage");
    print("remove OF saveDataFromHive indexPage $indexPage"); ////////
    //boxSelectedDays.close();
  }
}
