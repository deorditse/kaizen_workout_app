import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/app_controller/implement_getx_state_management.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_list_sports_workout/horizontal_list_sports_workout_model.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_list_sports_workout/widgets/what_toDo_day_inWorkout.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class ScrollListSportsWorkoutModel extends StatelessWidget {
  ScrollListSportsWorkoutModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImplementAppStateGetXController>(
      builder: (_controller) {
        return (_controller.myUser != null &&
                _controller.myUser!.listWorkout != null &&
                _controller.myUser!.listWorkout!.isNotEmpty)
            ? Container(
                height: MediaQuery.of(context).size.width / 1.9,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.myUser!.listWorkout!.length,
                  itemBuilder: (context, index) {
                    final countDay = DateTime.now().day -
                        _controller.myUser!.listWorkout!
                            .elementAt(index)
                            .firstWorkoutDay!
                            .day;

                    final sportsWorkoutModel =
                        _controller.dataSportsWorkoutList.elementAt(index);
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 18.0, top: 8, bottom: 8),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              width:
                                  sportsWorkoutModel.usersInWorkout!.length > 1
                                      ? MediaQuery.of(context).size.width / 1.4
                                      : MediaQuery.of(context).size.width - 36,
                              decoration: myStyleContainer(
                                context: context,
                              ),
                              child: HorizontalCardWidget(
                                key: UniqueKey(),
                                index: index,
                              ),
                            ),
                          ),
                          if (_controller.myUser!.listWorkout!
                                  .elementAt(index)
                                  .descriptionWorkoutList[countDay] !=
                              null)
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Container(
                                  width: sportsWorkoutModel
                                              .usersInWorkout!.length >
                                          1
                                      ? MediaQuery.of(context).size.width / 1.4
                                      : MediaQuery.of(context).size.width - 36,
                                  child: WhatToDoDayinWorkout(
                                    descriptionWorkoutList: _controller
                                        .myUser!.listWorkout!
                                        .elementAt(index)
                                        .descriptionWorkoutList[countDay],
                                    day: countDay,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Container(
                  decoration: myStyleContainer(
                    context: context,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
      },
    );
  }
}
