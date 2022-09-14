import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_bottom_photo_list_users_in_workout_and_button.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/row_key_name_chat.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (controllerApp) {
        final sportWorkout =
            controllerApp.dataSportsWorkoutList.elementAt(index);
        return Container(
          width: controllerApp.dataSportsWorkoutList.length > 1
              ? MediaQuery.of(context).size.width / 1.4
              : MediaQuery.of(context).size.width - 36,
          decoration: myStyleContainer(
            context: context,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: LayoutBuilder(
                builder: (context, constrains) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: keyNameAndChat(
                          context: context,
                          sportWorkout: sportWorkout,
                        ),
                      ),
                      Expanded(
                        child: _centralContentWithStatusData(
                          firstWorkoutDay: sportWorkout?.firstWorkoutDay,
                          lastWorkoutDay: sportWorkout?.lastWorkoutDay,
                          context: context,
                        ),
                      ),
                      Expanded(
                        child: rowWithListUsersAndButton(
                          index: index,
                          context: context,
                          sportWorkout: sportWorkout,
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
      {required firstWorkoutDay, required lastWorkoutDay, required context}) {
    final controllerSetting = Get.find<ImplementSettingGetXController>();

    return Column(
      children: [
        if (firstWorkoutDay.isAfter(DateTime.now()))
          Text(
            lastWorkoutDay == null
                ? 'длительность бессрочно'
                : 'длительность ${lastWorkoutDay!.difference(firstWorkoutDay).inDays} дней',
            style: Theme.of(context).textTheme.headline3,
          ),
        if (firstWorkoutDay.isBefore(DateTime.now()))
          Text(
            lastWorkoutDay == null
                ? 'длительность бессрочно'
                : 'идет с ${DateFormat('d MMM y').format(firstWorkoutDay)}',
            style: Theme.of(context).textTheme.headline3,
          ),
        const SizedBox(
          height: 3,
        ),
        GestureDetector(
          onTap: () {
            //меняю отслеживание id тренировки
            ImplementAppStateGetXController.instance.indexWorkoutList.value =
                index;
            //переходим на страницу календаря
            controllerSetting.currentTabIndex.value = 1;
          },
          child: Container(
            decoration: myStyleContainer(
                context: context,
                color: firstWorkoutDay.isAfter(DateTime.now())
                    ? Theme.of(context).primaryColor.withOpacity(0.4)
                    : Theme.of(context).primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    firstWorkoutDay.isAfter(DateTime.now())
                        ? 'старт ${DateFormat('d MMM y').format(firstWorkoutDay)}'
                        : lastWorkoutDay == null
                            ? 'пройдено дней ${DateTime.now().difference(firstWorkoutDay).inDays + 1} / начато ${DateFormat('d.MM.y').format(firstWorkoutDay)}'
                            : 'прогресс: ${DateTime.now().difference(firstWorkoutDay).inDays + 1}/${lastWorkoutDay!.difference(firstWorkoutDay).inDays}',
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
