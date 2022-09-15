import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/daily_workout_sheet/what_will_we_do_every_day.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/name_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/when_we_end.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/when_we_start.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало
import 'package:flutter/material.dart';

class IfEditSportWorkout extends StatelessWidget {
  IfEditSportWorkout({
    required this.sportsWorkoutModelForEdit,
    Key? key,
  }) : super(key: key);

  SportsWorkoutModel sportsWorkoutModelForEdit;
  final double _sizeBetweenContainer = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: _sizeBetweenContainer,
        ),
        nameWorkout(
            context: context,
            nameSportWorkoutEdit: sportsWorkoutModelForEdit.nameWorkout),
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
        Hero(
          tag: 'admin_edit_workout ${sportsWorkoutModelForEdit.idWorkout}',
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: ElevatedButton(
                onPressed: () => _editWorkout(context: context),
                child: const Text('Редактировать тренировку'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: _sizeBetweenContainer * 2.5,
        ),
      ],
    );
  }
}

void _editWorkout({required context}) {
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
