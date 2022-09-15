import 'package:flutter/material.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/daily_workout_sheet/what_will_we_do_every_day.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/name_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/steps_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/when_we_end.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/when_we_start.dart';

class IfNewCreateSportWorkout extends StatelessWidget {
  IfNewCreateSportWorkout({Key? key, required this.idWorkout})
      : super(key: key);
  final double _sizeBetweenContainer = 20;
  String idWorkout;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        steps(),
        SizedBox(
          height: _sizeBetweenContainer * 1.5,
        ),
        nameWorkout(context: context, idWorkout: idWorkout),
        SizedBox(
          height: _sizeBetweenContainer,
        ),
        whenWeStart(),
        SizedBox(
          height: _sizeBetweenContainer,
        ),
        WhenWeEnd(),
        SizedBox(
          height: _sizeBetweenContainer,
        ),
        const WhatWillWeDoEveryDay(),
        SizedBox(
          height: _sizeBetweenContainer,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () => _createWorkout(context: context),
            child: const Text('Создать тренировку'),
          ),
        ),
        SizedBox(
          height: _sizeBetweenContainer * 2.5,
        ),
      ],
    );
  }
}

void _createWorkout({required context}) {
  try {
    final controllerSportWorkout =
        CreateAndChangeSportWorkoutControllerGetxState.instance;

    if (controllerSportWorkout.lastWorkoutDay == null &&
        !controllerSportWorkout.toggleDateIsEnd) {
      mySnackBarButton(
        context: context,
        title: "обязательное поле*",
        message: "В пункте 2 выберите дату окончания тренировки",
      );
    } else {
      //добавляем тренировку в список тренировок и в БД
      controllerSportWorkout.createNewSportWorkoutFromCreateWorkoutPage(
          context: context);
    }
  } catch (error) {
    print('error from _createWorkout $error');
  }
}
