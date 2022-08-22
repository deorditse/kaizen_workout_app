import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/style.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../storage/SharedPreferences/my_shared_preferences.dart';
import '../../../../storage/hive/hive_data_for_tableCalendar.dart';
import '../../controller/calendar_page_controller.dart';
import '../../utils.dart';

class TableComplexExample extends StatefulWidget {
  const TableComplexExample({Key? key}) : super(key: key);

  @override
  TableComplexExampleState createState() => TableComplexExampleState();
}

TableBasicsController myListPageController = Get.find<TableBasicsController>();

class TableComplexExampleState extends State<TableComplexExample> {
  TableBasicsController colorController = Get.find<TableBasicsController>();


  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  static Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    selectedDays.clear();

    DataFromHiveForTableCalendar.getDataFromHiveForTableCalendar(
            myListPageController.indexMyArrayBody.value)
        .then((value) {
      setState(() {
        selectedDays = value.map((e) => e as DateTime).toSet();
      });
    });

    //так что вот как-то по индексу надо будет сохранять и подучать данные

    //TableComplexExampleState();
    SaveSharedPrefObject.getSelectedIndex()?.then((value) {
      SaveSharedPrefObject.getStatisticsFromSelectDaysFromCalendars(value)
          ?.then((value) => myListPageController.valueSelectDays.value = value);
    });

    DataFromHiveForTableCalendar.getkFirstDayListCalendar().then((value) {
      myListPageController.kFirstDayList.value =
          value.map((e) => e as DateTime).toList();

      print(
          "print from  complex example page  ${myListPageController.kFirstDayList.value}");
    });

    ///ToDo: initial Shared Preference Element
  }

  @override
  void dispose() {
    super.dispose();
    selectedDays.clear();
  }

  bool get canClearSelection =>
      selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  late final PageController _pageController;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    bool stateActiveDay = selectedDays.contains(selectedDay);

    Container homeDialogFromCalendarPage(BuildContext context) {
      return Container(
        key: widget.key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Отменить выполненный день?",
                style: TextStyle(
                  color: titleColorAlertDialog,
                  fontSize: fontSizeShowDialog,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: myButtonStyleFromShowDialog(),
                  onPressed: () {
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Text("Нет"),
                ),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  style: myButtonStyleFromShowDialog(),
                  onPressed: () {
                    setState(() {
                      selectedDays.remove(selectedDay);

                      DataFromHiveForTableCalendar
                          .saveDataFromHiveForTableCalendar(
                              myListPageController.indexMyArrayBody.value,
                              selectedDays.toList());

                      myListPageController.valueSelectDays.value =
                          selectedDays.length;
                      SaveSharedPrefObject
                          .saveStatisticsFromSelectDaysFromCalendars(
                              myListPageController.indexMyArrayBody.value,
                              myListPageController.valueSelectDays.value);
                      print(selectedDays.length);
                      SaveSharedPrefObject
                          .getStatisticsFromSelectDaysFromCalendars(
                              myListPageController.indexMyArrayBody.value);
                    });

                    Navigator.of(context).pop();
                  },
                  child: Text("Да"),
                ),
              ],
            ),
          ],
        ),
      );
    }

    void funcLigicButtonPress() {
      if (stateActiveDay) {
        stateActiveDay = !stateActiveDay;
        Get.defaultDialog(
          //  titlePadding: EdgeInsets.only(top: 0),
          //  contentPadding: EdgeInsets.only(top: 15),
          barrierDismissible: false,
          backgroundColor: backColorAlertDialog,
          content: homeDialogFromCalendarPage(context),
          title: "",
        );
        setState(() {
          selectedDays.add(selectedDay);

          DataFromHiveForTableCalendar.saveDataFromHiveForTableCalendar(
              myListPageController.indexMyArrayBody.value,
              selectedDays.toList());

          myListPageController.valueSelectDays.value = selectedDays.length;
          print(selectedDays.length);
          SaveSharedPrefObject.saveStatisticsFromSelectDaysFromCalendars(
              myListPageController.indexMyArrayBody.value,
              myListPageController.valueSelectDays.value);
        });
      } else {
        setState(() {
          stateActiveDay = stateActiveDay;
          selectedDays.add(selectedDay);

          DataFromHiveForTableCalendar.saveDataFromHiveForTableCalendar(
              myListPageController.indexMyArrayBody.value,
              selectedDays.toList());

          myListPageController.valueSelectDays.value = selectedDays.length;

          SaveSharedPrefObject.saveStatisticsFromSelectDaysFromCalendars(
              myListPageController.indexMyArrayBody.value,
              myListPageController.valueSelectDays.value);

          print("active day");
        });
        Get.snackbar("Еще один шаг выполнен!", "",
            duration: Duration(milliseconds: 1900),
            backgroundColor: Colors.black45,
            snackPosition: SnackPosition.BOTTOM,
            titleText: const Text(
              "Еще один шаг выполнен!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            messageText: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Отлично! Это было',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " ${myListPageController.valueSelectDays.value} ",
                    style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: 'выполнение',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ));
      }
    }

    setState(
      () {
        if (DateTime.now().isBefore(selectedDay)) {
          Get.defaultDialog(
            titlePadding: EdgeInsets.only(top: 0),
            //  contentPadding: EdgeInsets.only(top: 15),
            // barrierDismissible: false,
            backgroundColor: backColorAlertDialog,
            content: Container(
                child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  "${DateFormat('d MMM').format(selectedDay)} еще не наступил(о) 😮",
                  style: TextStyle(
                    color: titleColorAlertDialog,
                    fontSize: fontSizeShowDialog,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    // funcLigicButtonPress();
                    return Get.close(1);
                  },
                  child: Text(
                    "прекрасно!",
                    style: TextStyle(color: Colors.white54),
                  ),
                  //style: myButtonStyleFromShowDialog(),
                ),
              ],
            )),
            title: "",
          );
        } else {
          funcLigicButtonPress();
        }

        _focusedDay.value = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return _CalendarHeader(
              focusedDay: value,
              key: widget.key,
              clearButtonVisible: canClearSelection,
              onTodayButtonTap: () {
                setState(() => _focusedDay.value = DateTime.now());
              },
              onClearButtonTap: () => null,
              onLeftArrowTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
              onRightArrowTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            calendarBuilders: CalendarBuilders(
              todayBuilder: //сегодняшний день
                  (BuildContext context, DateTime day, DateTime focusedDay) {
                return Padding(
                  padding: paddingAvatars,
                  child: Center(
                    child: Container(
                      decoration: myBoxDecorationtyleCheckBox(
                          Colors.red.shade300, false),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Text(
                          DateFormat.d().format(day),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              selectedBuilder: //для выбранных ячеек
                  (BuildContext context, DateTime day, DateTime focusedDay) {
                return Padding(
                  padding: paddingAvatars,
                  child: Center(
                    child: GestureDetector(
                      child: Container(
                        decoration:
                            myBoxDecorationtyleCheckBox(Colors.green, true),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Text(
                            DateFormat.d().format(day),
                            style: myTextStyleCheckBox(Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              defaultBuilder: // Для невыбранных ячеек
                  (BuildContext context, DateTime day, DateTime focusedDay) {
                return GestureDetector(
                  child: Padding(
                    padding: paddingAvatars,
                    child: Center(
                      child: Container(
                        decoration: myBoxDecorationtyleCheckBox(
                            Colors.red.withOpacity(0.1), false),
                        child: CircleAvatar(
                          // key: ValueKey(widget.key),
                          backgroundColor: Colors.transparent,
                          child: Text(
                            DateFormat.d().format(day),
                            style: myTextStyleCheckBox(),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              outsideBuilder:
                  (BuildContext context, DateTime day, DateTime focusedDay) {
                return GestureDetector(
                  onTap: () {},
                  child: Center(
                    child: Container(
                      color: Colors.transparent,
                      width: 100,
                      height: 100,
                    ),
                  ),
                );
              },
              dowBuilder: (context, day) {
                final text = DateFormat.E().format(day);
                if (day.weekday == DateTime.sunday ||
                    day.weekday == DateTime.saturday) {
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              },
              headerTitleBuilder: (context, day) {
                return Text(
                  DateFormat.d().format(day),
                  style: TextStyle(color: Colors.red),
                );
              },
            ),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay.value,
            headerVisible: false,
            selectedDayPredicate: (day) => selectedDays.contains(day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: null,
            holidayPredicate: (day) {
              return day.day == _focusedDay;

              /// ToDO: change
            },
            onDaySelected: _onDaySelected,
            onRangeSelected: null,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: null,
          ),
        ),
      ],
    );
  }
}

class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;
  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);
//header calendar
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              headerText,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          TextButton(
            onPressed: onTodayButtonTap,
            child: Text(
              "today",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
          SizedBox(
            width: 6,
          ),
        ],
      ),
    );
  }
}
