import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_new_workout_page/style.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_new_workout_page/widgets/daily_workout_sheet/what_toDo_EveryDay_inWorkout.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateWorkoutPage extends StatefulWidget {
  static const id = '/news_page';

  CreateWorkoutPage({Key? key}) : super(key: key);

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  final double _sizeBetweenContainer = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: MyLeftDrawer.openLeftDrawer(),
        title: const FittedBox(
          child: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Text(
              'Создание тренировки id: 322456',
            ),
          ),
        ),
      ),
      // endDrawer: MyEndDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: _sizeBetweenContainer / 2,
              ),
              _steps(),
              SizedBox(
                height: _sizeBetweenContainer,
              ),
              _whenWeStart(),
              SizedBox(
                height: _sizeBetweenContainer,
              ),
              _whenWeEnd(),
              SizedBox(
                height: _sizeBetweenContainer,
              ),
              _whatWillWeDoEveryDay(),
              SizedBox(
                height: _sizeBetweenContainer,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: _createWorkout,
                  child: Text('Создать тренировку'),
                ),
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }

  void _showDatePickerStart() {
    DatePicker.showDatePicker(
      theme: myDatePickerTheme(context),
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      // maxTime: (DateTime(2040, 1, 1)),
      onChanged: (date) {
        CalendarControllerGetXState.instance.addFirstDay(date);
        if (CalendarControllerGetXState
                .instance.sportWorkoutNewCreate.lastWorkoutDay !=
            null) {
          CalendarControllerGetXState.instance
              .addLastDay(date.add(const Duration(days: 1)));
        }
      },
      currentTime: DateTime.now(),
      locale: LocaleType.ru,
    );
  }

  void _showDatePickerEnd() {
    DatePicker.showDatePicker(
      theme: myDatePickerTheme(context),
      context,
      showTitleActions: true,
      minTime: CalendarControllerGetXState
          .instance.sportWorkoutNewCreate.firstWorkoutDay
          .add(const Duration(days: 1)),
      // maxTime: (DateTime(2040, 1, 1)),
      onChanged: (date) {
        CalendarControllerGetXState.instance.addLastDay(date);
      },
      currentTime: DateTime.now(),
      locale: LocaleType.ru,
    );
  }

  void _createWorkout() {
    if (CalendarControllerGetXState
                .instance.sportWorkoutNewCreate.lastWorkoutDay ==
            null &&
        !CalendarControllerGetXState.instance.toggleDateIsEnd) {
      mySnackBarButton(
        context: context,
        title: "обязательное поле*",
        message: "В пункте 2 выберите дату окончания тренировки",
      );
    } else {
      CalendarControllerGetXState.instance
          .createSportWorkoutButtonTap(context: context);
    }
  }

  Widget _oldDayIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Последний день тренировки\nвключительно',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        GetBuilder<CalendarControllerGetXState>(
          builder: (controllerCalendar) {
            DateTime? _dateEnd =
                controllerCalendar.sportWorkoutNewCreate.lastWorkoutDay;
            return GestureDetector(
              onTap: _showDatePickerEnd,
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

  _steps() {
    return Container(
      decoration: myStyleContainer(
        context: context,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExpansionTile(
            expandedAlignment: Alignment.center,
            title: Center(
              child: Text(
                'Шаги',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            // initiallyExpanded: true,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Text(
                  '1. Выбираем дату начала тренировки\n2. Выбираем дату окончания тренировки\n3. Что делаем каждый день?\n4. Получаем код доступа к тренировке для друзей',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '*После создания тренировки вы станете администратором, только у вас будут права редактирования',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _whenWeStart() {
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
              onTap: _showDatePickerStart,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GetBuilder<CalendarControllerGetXState>(
                  builder: (controllerCalendar) {
                    DateTime? _dateStart = controllerCalendar
                        .sportWorkoutNewCreate.firstWorkoutDay;
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _whenWeEnd() {
    return Container(
      decoration: myStyleContainer(
        context: context,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                          value: CalendarControllerGetXState
                              .instance.toggleDateIsEnd,
                          onChanged: (value) {
                            setState(
                              () {
                                CalendarControllerGetXState
                                        .instance.toggleDateIsEnd =
                                    !CalendarControllerGetXState
                                        .instance.toggleDateIsEnd;
                                if (value) {
                                  CalendarControllerGetXState.instance
                                      .addLastDay(null);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
            if (!CalendarControllerGetXState.instance.toggleDateIsEnd)
              _oldDayIn(),
          ],
        ),
      ),
    );
  }

  _whatWillWeDoEveryDay() {
    return Container(
      decoration: myStyleContainer(
        context: context,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CalendarControllerGetXState>(
          builder: (controllerCalendar) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3. Что будем делать каждый день?',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'Администратор (Вы) сможете редактировать программу позже',
                  style: Theme.of(context).textTheme.headline3,
                ),
                if (controllerCalendar.sportWorkoutNewCreate.lastWorkoutDay !=
                        null ||
                    controllerCalendar.toggleDateIsEnd)
                  //создания листа с карточками дней
                  WhatToDoEveryDayInWorkout(),
                if (controllerCalendar.sportWorkoutNewCreate.lastWorkoutDay ==
                        null &&
                    !controllerCalendar.toggleDateIsEnd)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '*в пункте 2 выберите дату окончания тренировки',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
