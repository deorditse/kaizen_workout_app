import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_list_sports_workout/popup_with_users_in_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_list_sports_workout/widgets/what_toDo_day_inWorkout.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({Key? key, required this.index}) : super(key: key);

  final int index;

  final controllerSetting = Get.find<ImplementSettingGetXController>();

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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                'Ключ \n${sportWorkout.idWorkout}',
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 3,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  sportWorkout.nameWorkout.toString(),
                                  style: Theme.of(context).textTheme.headline2,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: FittedBox(
                                child: GestureDetector(
                                  onTap: () {
                                    controllerSetting.currentTabIndex.value = 2;
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.message,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      Text('Group chat'),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            sportWorkout.lastWorkoutDay != null
                                ? Text(
                                    'Длительность бессрочно',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  )
                                : Text(
                                    'Длительность дней ${sportWorkout.lastWorkoutDay?.day ?? 50 - sportWorkout.firstWorkoutDay!.day}',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              decoration: myStyleContainer(
                                  context: context,
                                  color: Theme.of(context).primaryColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Начало: ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            color: Theme.of(context).cardColor),
                                  ),
                                  Text(
                                    '${DateFormat('d MMM y').format(sportWorkout.firstWorkoutDay!)}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3!
                                        .copyWith(
                                            color: Theme.of(context).cardColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {
                                  popupWithUsersInWorkout(
                                    context: context,
                                    nameWorkout: sportWorkout.nameWorkout,
                                    usersInWorkout:
                                        sportWorkout.usersInWorkout!.cast(),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Участников ${sportWorkout.usersInWorkout?.length}',
                                      style:
                                          Theme.of(context).textTheme.headline3,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      height: constrains.maxHeight / 7,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            sportWorkout.usersInWorkout?.length,
                                        itemBuilder: (context, index) => Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4.0),
                                              child: CircleAvatar(
                                                radius:
                                                    constrains.maxHeight / 12,
                                                backgroundImage: NetworkImage(
                                                  'https://picsum.photos/1200/501',
                                                ),
                                              ),
                                            ),
                                            if (index ==
                                                sportWorkout.usersInWorkout!
                                                        .length -
                                                    1)
                                              Icon(Icons.arrow_forward_ios),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextButton(
                                onPressed: () {},
                                child: FittedBox(
                                  child: Text(
                                    'подробнее',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // WhatToDoDayinWorkout(
                      //   descriptionWorkoutList:
                      //       sportsWorkoutModel.descriptionWorkoutList[
                      //           (DateTime.now().day -
                      //               sportsWorkoutModel.firstWorkoutDay!.day)],
                      //   day: DateTime.now().day -
                      //       sportsWorkoutModel.firstWorkoutDay!.day,
                      // ),
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
}
