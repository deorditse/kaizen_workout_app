import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/daily_workout_sheet/what_will_we_do_every_day.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/name_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/when_we_end.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/when_we_start.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало
import 'package:flutter/material.dart';

class IfEditSportWorkout extends StatefulWidget {
  const IfEditSportWorkout({
    required this.indexInDataSportsWorkoutListWhenIAdmin,
    Key? key,
  }) : super(key: key);

  final int indexInDataSportsWorkoutListWhenIAdmin;

  @override
  State<IfEditSportWorkout> createState() => _IfEditSportWorkoutState();
}

class _IfEditSportWorkoutState extends State<IfEditSportWorkout> {
  final double _sizeBetweenContainer = 20;

  @override
  void initState() {
    super.initState();

    //обновляю данные по тренировке если есть редактирование
    CreateAndChangeSportWorkoutControllerGetxState.instance
        .editSportWorkoutFromEditWorkoutPage(
            indexInDataSportsWorkoutListWhenIAdmin:
                widget.indexInDataSportsWorkoutListWhenIAdmin);
  }

  @override
  void dispose() {
    super.dispose();
    CreateAndChangeSportWorkoutControllerGetxState.instance
        .clearAllDataInNewSportWorkout();
  }

  @override
  Widget build(BuildContext context) {
    final sportsWorkoutModelForEdit = ImplementAppStateGetXController
            .instance.dataSportsWorkoutListWhenIAdmin[
        widget.indexInDataSportsWorkoutListWhenIAdmin];
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
                onPressed: () => CreateAndChangeSportWorkoutControllerGetxState
                    .instance
                    .updateEditWorkoutButtonTap(
                        context: context,
                        indexInDataSportsWorkoutListWhenIAdmin:
                            widget.indexInDataSportsWorkoutListWhenIAdmin),
                child: const Text('Обновить тренировку'),
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
