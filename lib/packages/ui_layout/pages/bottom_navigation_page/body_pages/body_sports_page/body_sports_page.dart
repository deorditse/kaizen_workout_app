import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/app_controller/implement_getx_state_management.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/setting_controller/implement_getx_state_management.dart';
import 'package:kaizen/packages/style_app/lib/src/consts_app.dart';
import 'package:kaizen/packages/style_app/lib/src/style_card.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/pages/Test_calendars_page/controller/calendar_page_controller.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/app_bar_sports.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/calendar/calendar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/difault_dialog_all_program_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/list_users_comleted_task_day.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/statisticsWorkoutWidget.dart';

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
              builder: (controllerApp) {
                int indexInSportsWorkoutList =
                    controllerApp.indexWorkoutList.value;

                if (controllerApp
                        .dataSportsWorkoutList[indexInSportsWorkoutList] ==
                    null) {
                  return _homePage(context);
                } else {
                  // SportsWorkoutModel
                  final sportWorkout = controllerApp
                      .dataSportsWorkoutList[indexInSportsWorkoutList];
                  //indexInDataSportsWorkoutList
                  final indexInDataSportsWorkoutList =
                      controllerApp.getDataIndexInDataSportsWorkoutList(
                          indexInSportsWorkoutList);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _taskOfTheDay(
                        context: context,
                        indexInDataSportsWorkoutList:
                            indexInDataSportsWorkoutList,
                        sportWorkout: sportWorkout,
                      ),
                      SizedBox(
                        height: heightPadding,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 20),
                          decoration: myStyleContainer(context: context),
                          child: Calendar(key: key),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _watchSportsWorkoutList(
                          context: context,
                          indexInSportsWorkoutList: indexInSportsWorkoutList,
                          nameWorkout: sportWorkout?.nameWorkout,
                        ),
                      ),
                      statisticsWorkout(),
                      SizedBox(
                        height: heightPadding,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListUsersCompletedTaskForDay(),
                      ),
                      const SizedBox(
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

  void _defaultDialogWithDayProgram(context,
      {String? sportWorkoutModelDescription, required firstWorkoutDay}) {
    Get.defaultDialog(
      backgroundColor: myDefaultDialogBackground(context),
      titlePadding: EdgeInsets.only(
        top: 20,
      ),
      title: "Задача на ${DateFormat('d.MMM').format(DateTime.now())}",
      content: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0),
          // height: 350,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sportWorkoutModelDescription ?? 'нет данных',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
      ),
      titleStyle: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _homePage(context) {
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
                ImplementSettingGetXController.instance.currentTabIndex.value =
                    0;
              },
              child: Text('Выбрать или создать тренировку',
                  style: Theme.of(context).textTheme.headline2!),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _taskOfTheDay({
    required context,
    required indexInDataSportsWorkoutList,
    required sportWorkout,
  }) {
    return SizedBox(
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: myStyleContainer(context: context),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    child: Text(
                      'Задача на день',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (indexInDataSportsWorkoutList != null) {
                          _defaultDialogWithDayProgram(
                            context,
                            sportWorkoutModelDescription:
                                sportWorkout.descriptionWorkoutList[
                                    indexInDataSportsWorkoutList],
                            firstWorkoutDay: sportWorkout.firstWorkoutDay,
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.1),
                            border: Border(
                              top: BorderSide.none,
                              left: BorderSide(
                                width: 4.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              right: BorderSide.none,
                              bottom: BorderSide.none,
                            ),
                            // color: Colors.black.withOpacity(0.05),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  indexInDataSportsWorkoutList != null
                                      ? sportWorkout.descriptionWorkoutList[
                                          indexInDataSportsWorkoutList]!
                                      : 'нет данных',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
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
    );
  }

  _watchSportsWorkoutList(
      {required context, required indexInSportsWorkoutList, nameWorkout}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: TextButton(
        onPressed: () {
          defaultDialogAllProgramWorkout(
            context: context,
            indexSportWorkout: indexInSportsWorkoutList,
          );
        },
        child: Column(
          children: [
            const Text('Посмотреть программу тренировки'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                "${nameWorkout ?? ''}",
                style: TextStyle(
                    color: Theme.of(context).textTheme.headline3!.color),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
