import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/src/consts_app.dart';
import 'package:kaizen/packages/style_app/lib/src/style_card.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/pages/Test_calendars_page/controller/calendar_page_controller.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/app_bar_sports.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/calendar/calendar.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/default_dialog_exit_the_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/difault_dialog_all_program_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/list_users_comleted_task_day.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/ui_sports/widgets/statisticsWorkoutWidget.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

class BodySportsPage extends StatefulWidget {
  BodySportsPage({Key? key}) : super(key: key);

  @override
  State<BodySportsPage> createState() => _BodySportsPageState();
}

class _BodySportsPageState extends State<BodySportsPage> {
  final double heightPadding = 20;

  @override
  void initState() {
    super.initState();
    //инициирую контроллер календаря
    CalendarBinding();
  }

  @override
  Widget build(BuildContext context) {

    ///delete c этого слоя и перенести на бизнес логику как в CalendarBinding();
    Get.put(TableBasicsController());

    return Center(
      child: CustomScrollView(
        slivers: [
          mySliverSportsAppBar(context),
          SliverToBoxAdapter(
            child: GetBuilder<ImplementAppStateGetXController>(
              builder: (controllerApp) {
                if (controllerApp.dataSportsWorkoutList.isNotEmpty &&
                    controllerApp.dataSportsWorkoutList[
                            controllerApp.indexWorkoutList.value] !=
                        null) {
                  //отображение задачи на день из листа тренировок - нахождение индекса
                  int? indexInDescriptionWorkoutListForWorkout =
                      controllerApp.getDataIndexInDescriptionListForWorkout(
                          controllerApp.indexWorkoutList.value);

                  return _bodyCalendarPage(
                    indexInDescriptionListForWorkout:
                        indexInDescriptionWorkoutListForWorkout,
                    indexInSportWorkoutList:
                        controllerApp.indexWorkoutList.value,
                    key: widget.key,
                  );
                } else {
                  return _ifNoWorkout(context);
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

  SizedBox _taskOfTheDay({
    required context,
    required indexInDescriptionListForWorkout,
    required int indexInSportWorkoutList,
  }) {
    SportsWorkoutModel? sportWorkout = ImplementAppStateGetXController
        .instance.dataSportsWorkoutList[indexInSportWorkoutList];
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
                        if (indexInDescriptionListForWorkout != null) {
                          _defaultDialogWithDayProgram(
                            context,
                            sportWorkoutModelDescription:
                                sportWorkout!.descriptionWorkoutList[
                                    indexInDescriptionListForWorkout],
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
                                  indexInDescriptionListForWorkout != null
                                      ? sportWorkout!.descriptionWorkoutList[
                                          indexInDescriptionListForWorkout]!
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

  Widget _bodyCalendarPage({
    required int? indexInDescriptionListForWorkout,
    required int indexInSportWorkoutList,
    key,
  }) {
    return Builder(
      builder: (BuildContext context) {
        SportsWorkoutModel? sportWorkout = ImplementAppStateGetXController
            .instance.dataSportsWorkoutList[indexInSportWorkoutList];

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _taskOfTheDay(
              context: context,
              indexInDescriptionListForWorkout:
                  indexInDescriptionListForWorkout,
              indexInSportWorkoutList: indexInSportWorkoutList,
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
                indexInSportsWorkoutList: indexInSportWorkoutList,
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
              height: 40,
            ),
            TextButton(
              onPressed: () {
                defaultDialogExitTheWorkout(
                    context: context,
                    idWorkout:
                        sportWorkout!.idWorkout); //сделать колбек с результатом
              },
              child: Text(
                'Выйти из тренировки',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        );
      },
    );
  }
}

Widget _ifNoWorkout(context) {
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
              ImplementSettingGetXController.instance.currentTabIndex.value = 0;
            },
            child: Text(
              'Выбрать или создать тренировку',
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    ),
  );
}
