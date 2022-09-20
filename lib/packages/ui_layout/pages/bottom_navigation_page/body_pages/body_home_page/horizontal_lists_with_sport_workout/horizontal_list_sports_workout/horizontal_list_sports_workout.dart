import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/horizontal_lists_with_sport_workout/horizontal_list_sports_workout/card_workout..dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/horizontal_lists_with_sport_workout/widgets_horizontal_list/if_you_open_the_task_for_the_day.dart';

class HorizontalListSportsWorkout extends StatelessWidget {
  const HorizontalListSportsWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (controller) {
        return (controller.myUser != null &&
                controller.dataSportsWorkoutList.isNotEmpty)
            ? SizedBox(
                height: MediaQuery.of(context).size.width / 1.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dataSportsWorkoutList.length,
                  itemBuilder: (context, index) {
                    int? indexInDescriptionListForWorkout = controller
                        .getDataIndexInDescriptionListForWorkout(index);
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 18.0, top: 8, bottom: 8),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: WorkoutCard(
                                  key: UniqueKey(),
                                  indexInDataSportsWorkoutList: index,
                                ),
                              ),
                              if (indexInDescriptionListForWorkout != null)
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      width: controller.dataSportsWorkoutList
                                                  .length >
                                              1
                                          ? MediaQuery.of(context).size.width /
                                              1.4
                                          : MediaQuery.of(context).size.width -
                                              36,
                                      child: IfYouOpenTheTaskForTheDay(
                                        indexWorkoutList: index,
                                        indexDayInListWorkoutDescription:
                                            indexInDescriptionListForWorkout,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        if (index ==
                            controller.dataSportsWorkoutList.length - 1)
                          const SizedBox(
                            width: 18,
                          )
                      ],
                    );
                  },
                ),
              )
            : _listSportsWorkoutEmpty(context);
      },
    );
  }
}

_listSportsWorkoutEmpty(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    child: Container(
      decoration: myStyleContainer(
        context: context,
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            'Нет данных\nПрисоединяйся по ключу или создавай свою тренировку',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    // ),
  );
}
