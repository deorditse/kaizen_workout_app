import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../storage/SharedPreferences/DataFromSharedPreference.dart';
import '../../../../storage/SharedPreferences/my_shared_preferences.dart';
import '../../../../storage/hive/hive_data_for_tableCalendar.dart';
import '../../../../storage/hive/hive_date_for_button_menu.dart';
import '../../controller/calendar_page_controller.dart';
import '../../utils.dart';
import '../home_appBar.dart';
import 'home_bottom_menu/home_bottomNavigationBar.dart';
import 'body_calendar_page.dart';

class TableBasicsExample extends StatefulWidget {
  static String id = "/calendar_page";

  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

TableBasicsController myListPageController = Get.find<TableBasicsController>();

class _TableBasicsExampleState extends State<TableBasicsExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataFromHiveForTableCalendar.getkFirstDayListCalendar().then((value) {
      myListPageController.kFirstDayList.value =
          value.map((e) => e as DateTime).toList();

      print(
          "print from init calendar page  ${myListPageController.kFirstDayList.value}");

    });

    DataHiveForButtonMenu.getDataHiveForButtonMenuList()
        .then((value) => myListPageController.myListNamePage.value = value);

    // getDataFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //чтобы не смещались области из поля

      backgroundColor: Colors.white.withOpacity(0.85),

      appBar: homeAppBar(),

      body: Obx(() => BodyTableCalendar(
          key: ValueKey(myListPageController.indexMyArrayBody.value))),

      bottomNavigationBar: HomeBottomNavigationBar(),
    );
  }
}
