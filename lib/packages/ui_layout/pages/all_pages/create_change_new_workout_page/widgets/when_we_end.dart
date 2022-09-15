import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/style.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/style/style_calendar.dart';

class WhenWeEnd extends StatelessWidget {
  WhenWeEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(
        context: context,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CreateAndChangeSportWorkoutControllerGetxState>(
          builder: (controllerSportWorkout) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '2. Когда закончим?',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'бессрочно',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          Switch(
                            value: controllerSportWorkout.toggleDateIsEnd,
                            onChanged: (value) {
                              controllerSportWorkout.changeToggleDateIsEnd();

                              if (value) {
                                controllerSportWorkout.addLastDay(null);
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
              if (!CreateAndChangeSportWorkoutControllerGetxState
                  .instance.toggleDateIsEnd)
                _endDayIn(context: context),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _endDayIn({required context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Text(
          'Последний день тренировки\nвключительно',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      GetBuilder<CreateAndChangeSportWorkoutControllerGetxState>(
        builder: (controllerCalendar) {
          DateTime? _dateEnd = controllerCalendar.lastWorkoutDay;
          return GestureDetector(
            onTap: () => _showDatePickerEnd(context: context),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: FaIcon(
                      FontAwesomeIcons.calendar,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  _dateEnd != null
                      ? FittedBox(
                          child: Text(
                            DateFormat('d MMM y').format(_dateEnd),
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        )
                      : FittedBox(
                          child: Text(
                            'выбрать дату',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    ],
  );
}

void _showDatePickerEnd({required context}) {
  final controllerSportWorkout =
      CreateAndChangeSportWorkoutControllerGetxState.instance;
  DatePicker.showDatePicker(
    theme: myDatePickerTheme(context),
    context,
    showTitleActions: true,
    minTime:
        controllerSportWorkout.firstWorkoutDay.add(const Duration(days: 1)),
    // maxTime: (DateTime(2040, 1, 1)),
    onChanged: (date) {
      controllerSportWorkout.addLastDay(date);
    },
    currentTime: DateTime.now(),
    locale: LocaleType.ru,
  );
}
