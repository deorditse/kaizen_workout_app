import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_bottom_photo_list_users_in_workout_and_button.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_key_name_chat.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({Key? key, required this.indexInDataSportsWorkoutList})
      : super(key: key);

  final int indexInDataSportsWorkoutList;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (controllerApp) {
        return Container(
          width: controllerApp.dataSportsWorkoutList.length > 1
              ? MediaQuery.of(context).size.width / 1.4
              : MediaQuery.of(context).size.width - 36,
          decoration: myStyleContainer(
            context: context,
          ),
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: keyNameAndChat(
                          context: context,
                          index: indexInDataSportsWorkoutList,
                        ),
                      ),
                      Expanded(
                        child: _centralContentWithStatusData(
                          indexInDataSportsWorkoutList:
                              indexInDataSportsWorkoutList,
                          context: context,
                        ),
                      ),
                      Expanded(
                        child: rowWithListUsersAndButton(
                          index: indexInDataSportsWorkoutList,
                          context: context,
                          constrains: constrains,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  _centralContentWithStatusData(
      {required indexInDataSportsWorkoutList, required context}) {
    final controllerSetting = Get.find<ImplementSettingGetXController>();

    SportsWorkoutModel? sportWorkout = ImplementAppStateGetXController
        .instance.dataSportsWorkoutList[indexInDataSportsWorkoutList];

    return Column(
      children: [
        if (sportWorkout!.firstWorkoutDay.isAfter(DateTime.now()))
          Text(
            sportWorkout.lastWorkoutDay == null
                ? 'длительность бессрочно'
                : 'длительность ${sportWorkout.lastWorkoutDay!.difference(sportWorkout.firstWorkoutDay).inDays} дней',
            style: Theme.of(context).textTheme.headline3,
          ),
        if (sportWorkout.firstWorkoutDay.isBefore(DateTime.now()))
          Text(
            sportWorkout.lastWorkoutDay == null
                ? 'длительность бессрочно'
                : 'идет с ${DateFormat('d MMM y').format(sportWorkout.firstWorkoutDay)}',
            style: Theme.of(context).textTheme.headline3,
          ),
        const SizedBox(
          height: 3,
        ),
        GestureDetector(
          onTap: () {
            //меняю отслеживание id тренировки
            ImplementAppStateGetXController.instance.indexWorkoutList.value =
                indexInDataSportsWorkoutList;
            //переходим на страницу календаря
            controllerSetting.currentTabIndex.value = 1;
          },
          child: Container(
            decoration: myStyleContainer(
                context: context,
                color: sportWorkout.firstWorkoutDay.isAfter(DateTime.now())
                    ? Theme.of(context).primaryColor.withOpacity(0.4)
                    : Theme.of(context).primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    sportWorkout.firstWorkoutDay.isAfter(DateTime.now())
                        ? 'старт ${DateFormat('d MMM y').format(sportWorkout.firstWorkoutDay)}'
                        : sportWorkout.lastWorkoutDay == null
                            ? 'пройдено дней ${DateTime.now().difference(sportWorkout.firstWorkoutDay).inDays + 1} / начато ${DateFormat('d.MM.y').format(sportWorkout.firstWorkoutDay)}'
                            : 'прогресс: ${DateTime.now().difference(sportWorkout.firstWorkoutDay).inDays + 1}/${sportWorkout.lastWorkoutDay!.difference(sportWorkout.firstWorkoutDay).inDays}',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Theme.of(context).cardColor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
