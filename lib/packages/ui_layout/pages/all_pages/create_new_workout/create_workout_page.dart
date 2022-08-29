import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/model/lib/model.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_new_workout/widgets/daily_workout_sheet/what_toDo_EveryDay_inWorkout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_new_workout/widgets/default_dialog_create_key.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/style.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_text_field.dart';
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

  late SportsWorkoutModel sportsWorkoutModel;
  DateTime? _dateStart;
  DateTime? _dateEnd;
  bool _togleDateEnd = false;

  @override
  void initState() {
    super.initState();

    //создадим новую программу тренировок
    sportsWorkoutModel = SportsWorkoutModel(
      idWorkout: '',
      nameWorkout: '',
      firstWorkoutDay: null,
      adminWorkout: NameAndPhotoUser(
        idUser: '',
        name: 'name',
        photoPath: 'photoPath',
        family: 'family',
      ),
      descriptionWorkoutList: [],
      topUsers: null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: MyLeftDrawer.openLeftDrawer(),
        title: FittedBox(
            child: const Text(
          'Создание тренировки',
        )),
        // actions: [
        //   MyEndDrawer.openEndDrawer(),
        // ],
      ),
      // endDrawer: MyEndDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _sizeBetweenContainer / 2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: myStyleContainer(
                  context: context,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Шаги:\n\n1. Когда начнем?\n2. Когда закончим?\n3. Что делаем каждый день?\n4. Получаем код доступа к тренировке для друзей'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '*После создания тренировки вы станете администратором, только у вас будут права редактирования',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _sizeBetweenContainer,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
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
                            'Когда начинаем?',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'Первый день тренировки',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              // maxTime: (DateTime(2040, 1, 1)),
                              onChanged: (date) {
                                print('change $date');
                                setState(() {
                                  _dateStart = date;
                                });
                              },

                              currentTime: DateTime.now(),
                              locale: LocaleType.ru,
                            );
                          },
                          child: Column(
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
                                        DateFormat('d MMM y')
                                            .format(_dateStart!),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    )
                                  : FittedBox(
                                      child: Text(
                                        'выбрать дату',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _sizeBetweenContainer,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
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
                                'Когда закончим?',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('бессрочно'),
                                  Switch(
                                    value: _togleDateEnd,
                                    onChanged: (value) {
                                      setState(() {
                                        _togleDateEnd = !_togleDateEnd;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                      if (!_togleDateEnd)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Последний день тренировки\nвключительно',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  showTitleActions: true,
                                  minTime: DateTime.now(),
                                  // maxTime: (DateTime(2040, 1, 1)),
                                  onChanged: (date) {
                                    setState(() {
                                      _dateEnd = date;
                                    });
                                  },

                                  currentTime: DateTime.now(),
                                  locale: LocaleType.ru,
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 4.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.calendar,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    _dateEnd != null
                                        ? FittedBox(
                                            child: Text(
                                              DateFormat('d MMM y')
                                                  .format(_dateEnd!),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2,
                                            ),
                                          )
                                        : FittedBox(
                                            child: Text(
                                              'выбрать дату',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3,
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _sizeBetweenContainer,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                decoration: myStyleContainer(
                  context: context,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Что будем делать каждый день?',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Text(
                        'Администратор (Вы) сможете редактировать программу позже',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      WhatToDoEveryDayinWorkout(
                        sportsWorkoutModel: sportsWorkoutModel,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _sizeBetweenContainer,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                    'Тренировка создана',
                    '',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  defaultDialogAboutSports(context: context);
                },
                child: Text('Создать тренировку'),
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
