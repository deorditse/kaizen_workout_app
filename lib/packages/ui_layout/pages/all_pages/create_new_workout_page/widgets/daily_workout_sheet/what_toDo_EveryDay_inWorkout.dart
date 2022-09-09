import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/style_app/style_card.dart';

class WhatToDoEveryDayInWorkout extends StatelessWidget {
  const WhatToDoEveryDayInWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: MediaQuery.of(context).size.width / 2,
      child: GetBuilder<CalendarControllerGetXState>(
        builder: (controllerCalendar) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controllerCalendar.itemCount, //may by null
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: myStyleContainer(
                    context: context,
                    color: Theme.of(context).cardColor,
                  ),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: CardDailyWorkoutSheet(
                    index: index,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CardDailyWorkoutSheet extends StatefulWidget {
  CardDailyWorkoutSheet({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  State<CardDailyWorkoutSheet> createState() => _CardDailyWorkoutSheetState();
}

class _CardDailyWorkoutSheetState extends State<CardDailyWorkoutSheet> {
  bool _toggleRepeatToTheEndOfTheList = false;
  bool _togleIsHoliday = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'День ${widget.index + 1}',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              Text(
                'выходной',
                style: Theme.of(context).textTheme.headline3,
              ),
              Checkbox(
                splashRadius: 1000,
                value: _togleIsHoliday,
                onChanged: (bool? value) {
                  setState(() {
                    _togleIsHoliday = !_togleIsHoliday!;
                  });
                },
              ),
            ],
          ),
          Expanded(
            child: GetBuilder<CalendarControllerGetXState>(
              builder: (controllerCalendar) {
                return GestureDetector(
                  onTap: () {
                    if (CalendarControllerGetXState
                                .instance.descriptionWorkoutList[0] ==
                            null &&
                        widget.index != 0) {
                      Get.snackbar(
                        '!!!',
                        'Начните заполнение с первого дня тренировки',
                        snackPosition: SnackPosition.BOTTOM,
                      );
                    } else {
                      _togleIsHoliday
                          ? null
                          : _methodDialog(context, indexDay: widget.index);
                    }
                  },
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
                              width: 4.0,
                              color: Theme.of(context).primaryColor),
                          right: BorderSide.none,
                          bottom: BorderSide.none,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "${controllerCalendar.taskForTheDay(indexDay: widget.index) ?? 'задания на день не добавлено'}",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
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
                );
              },
            ),
          ),
          FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Повторить до конца списка'),
                Switch(
                  value: _toggleRepeatToTheEndOfTheList,
                  onChanged: (bool value) {
                    setState(() {
                      _toggleRepeatToTheEndOfTheList =
                          !_toggleRepeatToTheEndOfTheList;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_methodDialog(context, {required int indexDay}) {
  TextEditingController _controllerTexr = TextEditingController(
      text: CalendarControllerGetXState
          .instance.descriptionWorkoutList[indexDay]);
  return Get.defaultDialog(
    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
    titlePadding: const EdgeInsets.only(
      top: 20,
    ),
    title: "Описание задачи на день",
    content: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.width,
        child: TextField(
          autofocus: true,
          controller: _controllerTexr,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            _controllerTexr.text = value;
            CalendarControllerGetXState.instance
                .updateTaskForTheDay(indexDay: indexDay, value: value);
          },
          onSubmitted: (_) {
            Get.close(1);
          },
          maxLines: 20,
          //  minLines: 5,
          decoration: InputDecoration(
            fillColor: Theme.of(context).cardColor.withOpacity(0.75),
            filled: true,
            hintText: 'Подробно опишите задание на этот день тренировки',
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.headline2,
          ),
          keyboardType: TextInputType.text,
          cursorColor: Theme.of(context).primaryColor,

          style: Theme.of(context).textTheme.headline1,
          textCapitalization: TextCapitalization.sentences,
          //Заглавные для предложения
          textAlign: TextAlign.left,
          // controller: _controllerTextFieldDown,
        ),
      ),
    ),
    titleStyle: const TextStyle(
      color: Colors.white70,
      fontSize: 16,
    ),
  );
}
