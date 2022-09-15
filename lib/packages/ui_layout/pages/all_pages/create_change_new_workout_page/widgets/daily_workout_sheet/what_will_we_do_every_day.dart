import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/daily_workout_sheet/what_toDo_EveryDay_inWorkout.dart';

class WhatWillWeDoEveryDay extends StatelessWidget {
  const WhatWillWeDoEveryDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: myStyleContainer(
        context: context,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<CreateAndChangeSportWorkoutControllerGetxState>(
          builder: (controllerCalendar) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '3. Что будем делать каждый день?',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'Администратор (Вы) сможете редактировать программу позже',
                  style: Theme.of(context).textTheme.headline3,
                ),
                if (controllerCalendar.lastWorkoutDay != null ||
                    controllerCalendar.toggleDateIsEnd)
//создания листа с карточками дней
                  const WhatToDoEveryDayInWorkout(),
                if (controllerCalendar.lastWorkoutDay == null &&
                    !controllerCalendar.toggleDateIsEnd)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '*в пункте 2 выберите дату окончания тренировки',
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
