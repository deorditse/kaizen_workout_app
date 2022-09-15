import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';

class WhatToDoEveryDayInWorkout extends StatelessWidget {
  const WhatToDoEveryDayInWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      height: MediaQuery.of(context).size.width / 1.7,
      child: GetBuilder<CreateAndChangeSportWorkoutControllerGetxState>(
        builder: (controllerCalendar) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controllerCalendar.itemCount ?? 1, //may by null
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: myStyleContainer(
                    context: context,
                    color: Theme.of(context).cardColor,
                  ),
                  width: controllerCalendar.itemCount != null
                      ? MediaQuery.of(context).size.width / 1.5
                      : MediaQuery.of(context).size.width / 1.14,
                  child: CardDailyWorkoutSheet(
                    index: controllerCalendar.itemCount != null ? index : 0,
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
    final controllerCreateNewWorkout =
        CreateAndChangeSportWorkoutControllerGetxState.instance;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                if (controllerCreateNewWorkout.itemCount == null)
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Задача на каждый день',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (controllerCreateNewWorkout.itemCount != null)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${DateFormat('d MMM y').format(DateTime.now().add(Duration(days: widget.index)))}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Row(
                          children: [
                            Text(
                              'выходной',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            Checkbox(
                              splashRadius: 1000,
                              value: _togleIsHoliday,
                              onChanged: (bool? value) {
                                setState(
                                  () {
                                    _togleIsHoliday = !_togleIsHoliday;
                                    value == true
                                        ? controllerCreateNewWorkout
                                            .updateTaskForTheDay(
                                            indexDay: widget.index,
                                            value: 'Выходной',
                                            togleIsHoliday: true,
                                          )
                                        : controllerCreateNewWorkout
                                            .updateTaskForTheDay(
                                            indexDay: widget.index,
                                            value: null,
                                          );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: GetBuilder<CreateAndChangeSportWorkoutControllerGetxState>(
              builder: (controllerCalendar) {
                return GestureDetector(
                  onTap: () {
                    if (_togleIsHoliday) {
                      mySnackBarButton(
                        context: context,
                        title: 'Выходной',
                        message:
                            'Чтобы отредактировать тренировку выключите check выходной',
                      );
                    } else if (controllerCalendar
                                .descriptionWorkoutListFromCreatePage[0] ==
                            null &&
                        widget.index != 0) {
                      mySnackBarButton(
                        context: context,
                        title: '!!!',
                        message: 'Начните заполнение с первого дня тренировки',
                      );
                    } else {
                      _methodDialog(context, indexDay: widget.index);
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
                            child: Column(
                              children: [
                                controllerCalendar.toggleDateIsEnd
                                    ? Text(
                                        controllerCalendar
                                                    .descriptionWorkoutListFromCreatePage[
                                                widget.index] ??
                                            'Нажмите и добавьте задание на все дни',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.clip,
                                      )
                                    : Text(
                                        controllerCalendar
                                                    .descriptionWorkoutListFromCreatePage[
                                                widget.index] ??
                                            'Задание на день не добавлено',
                                        // 'Нажмите и добавьте задание на все дни',
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.clip,
                                      )
                              ],
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
          Flexible(
            flex: 1,
            child: Column(
              children: [
                if (CreateAndChangeSportWorkoutControllerGetxState
                            .instance.itemCount !=
                        null &&
                    CreateAndChangeSportWorkoutControllerGetxState.instance
                            .descriptionWorkoutListFromCreatePage.length >
                        1)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          child: Text('Повторить до конца списка'),
                        ),
                        FittedBox(
                          child: Switch(
                            value: _toggleRepeatToTheEndOfTheList,
                            onChanged: (bool value) {
                              setState(
                                () {
                                  if (!_togleIsHoliday) {
                                    _toggleRepeatToTheEndOfTheList =
                                        !_toggleRepeatToTheEndOfTheList;

                                    if (value) {
                                      final controllerCreateNewWorkout =
                                          CreateAndChangeSportWorkoutControllerGetxState
                                              .instance;

                                      controllerCreateNewWorkout
                                          .updateTaskForTheDay(
                                        indexDay: widget.index,
                                        value: controllerCreateNewWorkout
                                                .descriptionWorkoutListFromCreatePage[
                                            widget.index],
                                        toggleRepeatToTheEndOfTheList: true,
                                        repeatWithIndex: widget.index,
                                      );
                                      mySnackBarButton(
                                        context: context,
                                        title: 'Повтор до конца списка',
                                        message: '',
                                      );
                                    }

                                    return;
                                  } else {
                                    mySnackBarButton(
                                      context: context,
                                      title: 'Выключите выходной',
                                      message:
                                          'Чтобы повторить до конца списка',
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
  final controllerCreateNewWorkout =
      CreateAndChangeSportWorkoutControllerGetxState.instance;

  TextEditingController _controllerTexr = TextEditingController(
      text: controllerCreateNewWorkout
          .descriptionWorkoutListFromCreatePage[indexDay]);
  return Get.defaultDialog(
    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.7),
    titlePadding: const EdgeInsets.only(
      top: 20,
    ),
    title: !controllerCreateNewWorkout.toggleDateIsEnd
        ? "Описание задачи на день"
        : "Описание задачи на все дни",
    content: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(0),
        height: MediaQuery.of(context).size.width,
        child: TextField(
          autofocus: true,
          controller: _controllerTexr,
          textInputAction: TextInputAction.done,
          onChanged: (value) {
            controllerCreateNewWorkout.updateTaskForTheDay(
                indexDay: indexDay, value: value);
          },
          onSubmitted: (_) {
            Get.close(1);
          },
          maxLines: 20,
          //  minLines: 5,
          decoration: InputDecoration(
            fillColor: Theme.of(context).cardColor.withOpacity(0.75),
            filled: true,
            hintText: !controllerCreateNewWorkout.toggleDateIsEnd
                ? 'Подробно опишите задание на этот день тренировки'
                : 'Подробно опишите задание на все дни тренировок',
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
