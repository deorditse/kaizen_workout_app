import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/pages/Test_calendars_page/controller/calendar_page_controller.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/calendar/calendar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/app_bar_sports.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/difault_dialog_all_program_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/list_users_comleted_task_day.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/statisticsWorkoutWidget.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

import '../../../../../model/lib/src/sports_page/sports_workout_model.dart';

class BodySportsPage extends StatelessWidget {
  BodySportsPage({Key? key}) : super(key: key);

  final double heightPadding = 20;

  @override
  Widget build(BuildContext context) {
    Get.put(TableBasicsController());

    return Center(
      child: CustomScrollView(
        slivers: [
          mySliverSportsAppBar(context),
          SliverToBoxAdapter(
            child: GetBuilder<ImplementAppStateGetXController>(
              builder: (_controllerApp) {
                final sportWorkoutModel =
                    _controllerApp.dataSportsWorkoutList.isNotEmpty
                        ? _controllerApp.dataSportsWorkoutList
                            .cast()[_controllerApp.indexWorkoutList.value]!
                        // as SportsWorkoutModel
                        : null;

                if (sportWorkoutModel == null) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Center(
                        child: Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            ImplementSettingGetXController _controllerSetting =
                                Get.find();
                            _controllerSetting.currentTabIndex.value = 0;
                          },
                          child: Text('Выбрать или создать тренировку',
                              style: Theme.of(context).textTheme.headline2!),
                        ),
                      ],
                    )),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 140,
                        //flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: myStyleContainer(context: context),
                            //color Header
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  // decoration: BoxDecoration(
                                  // border: Border(
                                  //   bottom: BorderSide(
                                  //     width: 1,
                                  //     color: Colors.lightGreen,
                                  //     style: BorderStyle.solid,
                                  //   ),
                                  // ),
                                  // color: Colors.green.withOpacity(0.6),
                                  // ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Container(
                                      child: Text(
                                        'Задача на день',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 12,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        //  color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(0),
                                          bottomRight: Radius.circular(10),
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.defaultDialog(
                                            backgroundColor:
                                                myDefaultDialogBackground(
                                                    context),
                                            titlePadding: EdgeInsets.only(
                                              top: 20,
                                            ),
                                            title: "Задача на день",
                                            content: SingleChildScrollView(
                                              child: Container(
                                                padding: EdgeInsets.all(0),
                                                // height: 350,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'задача на написать метод поиска дня',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            titleStyle: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(0.1),
                                              border: Border(
                                                top: BorderSide.none,
                                                left: BorderSide(
                                                  width: 4.0,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                right: BorderSide.none,
                                                bottom: BorderSide.none,
                                              ),
                                              // color: Colors.black.withOpacity(0.05),
                                            ),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  child: Text(
                                                    'Сюда выводится описание задачи на день',
                                                    style: TextStyle(
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      // Colors.green.shade700,
                                                      fontSize: 14,
                                                      //fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                    overflow: TextOverflow.clip,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightPadding,
                      ),
                      Container(
                        //flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 20),
                            decoration: myStyleContainer(context: context),
                            child: Calendar(key: key),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TextButton(
                          onPressed: () {
                            defaultDialogAllProgramWorkout(
                                context: context,
                                descriptionWorkoutList: [],
                                start: null);
                          },
                          child: Text('Посмотреть программу тренировки'),
                        ),
                      ),
                      statisticsWorkout(),
                      SizedBox(
                        height: heightPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListUsersCompletedTaskForDay(),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
