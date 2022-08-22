import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/calendar_header.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/default_dialog_if_day_has_not_come.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/list_users_comleted_task_day.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/snackbar_widget_add_day.dart';
import 'package:table_calendar/table_calendar.dart';
import '../style/style_calendar.dart';
import 'utils.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());

  static Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  final CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  bool get canClearSelection =>
      selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null;

  late final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<DateTime>(
          valueListenable: _focusedDay,
          builder: (context, value, _) {
            return CalendarHeader(
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
                        decoration: myBoxDecorationtyleCheckBox(
                            Theme.of(context).primaryColor, true),
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
                          color: Colors.red.withOpacity(0.4),
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      text,
                      style: TextStyle(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          fontWeight: FontWeight.bold),
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
            },
            onDaySelected: _onDaySelectedTap,
            onDayLongPressed: _onDaySelectedLongTap,
            onRangeSelected: null,
            onCalendarCreated: (controller) => _pageController = controller,
            onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
            onFormatChanged: null,
          ),
        ),
      ],
    );
  }

  void _onDaySelectedTap(DateTime selectedDay, DateTime focusedDay) {
    bool stateActiveDay = selectedDays.contains(selectedDay);

    if (DateTime.now().isBefore(selectedDay)) {
      defaultDialogIfDayHasNotCome(selectedDay: selectedDay, context: context);
    } else {
      if (!stateActiveDay) {
        stateActiveDay = !stateActiveDay;

        setState(() {
          stateActiveDay = stateActiveDay;
          selectedDays.add(selectedDay);

          print("active day");
        });

        snackBarAddSelectSay();

        setState(() {
          selectedDays.add(selectedDay);
        });
      } else {
        Get.defaultDialog(title: 'сделать смену программы по клику', backgroundColor: myDefaultDialogBackground(context),);
      }
    }
  }

  void _onDaySelectedLongTap(DateTime selectedDay, DateTime focusedDay) {
    bool stateActiveDay = selectedDays.contains(selectedDay);

    ///перенести в отдельный виджет после создания контроллера для календаря
    Container _homeDialogFromCalendarPage(BuildContext context) {
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
          barrierDismissible: false,

          backgroundColor: myDefaultDialogBackground(context),//backColorAlertDialog,
          content: _homeDialogFromCalendarPage(context),
          title: "",
        );
        setState(() {
          selectedDays.add(selectedDay);
        });
      } else {}
    }

    setState(
      () {
        funcLigicButtonPress();

        _focusedDay.value = focusedDay;
        _rangeStart = null;
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      },
    );
  }
}
