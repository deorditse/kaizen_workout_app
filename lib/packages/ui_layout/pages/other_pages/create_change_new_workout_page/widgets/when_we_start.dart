import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/style.dart';

Widget whenWeStart() {
  return Builder(
    builder: (BuildContext context) {
      return Container(
        decoration: myStyleContainer(
          context: context,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1. Когда начинаем?',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'Первый день тренировки',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => _showDatePickerStart(context: context),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GetBuilder<
                      CreateAndChangeSportWorkoutControllerGetxState>(
                    builder: (controllerCalendar) {
                      DateTime? _dateStart = controllerCalendar.firstWorkoutDay;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: FaIcon(
                              FontAwesomeIcons.calendar,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          _dateStart != null
                              ? FittedBox(
                                  child: Text(
                                    DateFormat('d MMM y').format(_dateStart),
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                )
                              : FittedBox(
                                  child: Text(
                                    'выбрать дату',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showDatePickerStart({required BuildContext context}) {
  DatePicker.showDatePicker(
    theme: myDatePickerTheme(context),
    context,
    showTitleActions: true,
    minTime: DateTime.now(),
    // maxTime: (DateTime(2040, 1, 1)),
    onChanged: (date) {
      final controllerSportWorkout =
          CreateAndChangeSportWorkoutControllerGetxState.instance;
      controllerSportWorkout.addFirstDay(date);
      if (controllerSportWorkout.lastWorkoutDay != null) {
        controllerSportWorkout.addLastDay(date.add(const Duration(days: 1)));
      }
    },
    currentTime: DateTime.now(),
    locale: LocaleType.ru,
  );
}
