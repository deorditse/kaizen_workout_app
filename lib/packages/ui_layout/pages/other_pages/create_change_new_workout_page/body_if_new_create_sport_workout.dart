import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/daily_workout_sheet/what_will_we_do_every_day.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/name_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/steps_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/when_we_end.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/when_we_start.dart';

class IfNewCreateSportWorkout extends StatelessWidget {
  IfNewCreateSportWorkout({Key? key}) : super(key: key);
  final double _sizeBetweenContainer = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        steps(),
        SizedBox(
          height: _sizeBetweenContainer * 1.5,
        ),
        nameWorkout(context: context),
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
            onPressed: () => CreateAndChangeSportWorkoutControllerGetxState
                .instance
                .createNewSportWorkoutFromCreateWorkoutPage(context: context),
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
