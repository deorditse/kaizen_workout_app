import 'package:get/get.dart';
import '../../pages/Test_calendars_page/controller/calendar_page_controller.dart';
import '../hive/hive_data_for_tableCalendar.dart';
import 'my_shared_preferences.dart';

TableBasicsController myListPageController = Get.find<TableBasicsController>();

Future<void> getDataFromSharedPref() async {
  SaveSharedPrefObject.getSelectedIndex()?.then((value) {
    myListPageController.indexMyArrayBody.value = value;
//
    SaveSharedPrefObject.getTextFieldUp(
            myListPageController.indexMyArrayBody.value)
        ?.then((value) =>
            myListPageController.myStringMessageTextFieldUp.value = value);

    //контроллер TextFieldDown
    SaveSharedPrefObject.getTextFieldDown(
            myListPageController.indexMyArrayBody.value)
        ?.then((value) =>
            myListPageController.myStringMessageTextFieldDown.value = value);

    //отображу количество выполнений этого окна

    SaveSharedPrefObject.getStatisticsFromSelectDaysFromCalendars(
            myListPageController.indexMyArrayBody.value)
        ?.then((value) => myListPageController.valueSelectDays.value = value);
  });
}

Future<void> removeAllDataForPageFromSharedPref(index) async {
  SaveSharedPrefObject.removeTextFieldDown(index);

  SaveSharedPrefObject.removeTextFieldUp(index);

  SaveSharedPrefObject.removeStatisticsFromSelectDaysFromCalendars(index);

  DataFromHiveForTableCalendar.removeDataFromHiveForTableCalendar(index);
  myListPageController.myListNamePage.removeAt(index);

  if (myListPageController.myListNamePage.length == 0) {
    myListPageController.myListNamePage.add("Страница 1");
  }
  // myListPageController.myListPage
  //     .remove(myListPageController.myListPage[index]);
}
