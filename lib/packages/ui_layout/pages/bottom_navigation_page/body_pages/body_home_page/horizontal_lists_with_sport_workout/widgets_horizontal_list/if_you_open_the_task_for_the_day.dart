import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

class IfYouOpenTheTaskForTheDay extends StatefulWidget {
  IfYouOpenTheTaskForTheDay(
      {Key? key,
      required this.indexDayInListWorkoutDescription,
      required this.indexWorkoutList})
      : super(key: key);
  int indexWorkoutList;
  int indexDayInListWorkoutDescription;

  @override
  State<IfYouOpenTheTaskForTheDay> createState() =>
      _IfYouOpenTheTaskForTheDayState();
}

class _IfYouOpenTheTaskForTheDayState extends State<IfYouOpenTheTaskForTheDay> {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: GestureDetector(
        onTap: () {
          //меняю отслеживание id тренировки
          ImplementAppStateGetXController.instance.indexWorkoutList.value =
              widget.indexWorkoutList;
          //переходим на страницу календаря
          controllerSetting.currentTabIndex.value = 1;
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Открыто задание на день',
              style: Theme.of(context).textTheme.headline3,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    border: Border(
                      top: BorderSide.none,
                      left: BorderSide(
                          width: 4.0, color: Theme.of(context).primaryColor),
                      right: BorderSide.none,
                      bottom: BorderSide.none,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GetBuilder<ImplementAppStateGetXController>(
                            builder: (controllerApp) {
                          SportsWorkoutModel? sportWorkout = controllerApp
                              .dataSportsWorkoutList
                              .elementAt(widget.indexWorkoutList);

                          final String descriptionWorkout = sportWorkout
                                      ?.descriptionWorkoutList[
                                  widget.indexDayInListWorkoutDescription] ??
                              'error';

                          return Text(
                            descriptionWorkout ?? 'нет данных',
                            // "Отжаться 50 раз",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14,
                              //fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
