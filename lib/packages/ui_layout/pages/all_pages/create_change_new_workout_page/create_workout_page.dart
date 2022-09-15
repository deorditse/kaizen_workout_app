import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/page_if_edit_sport_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/page_if_new_create_sport_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/all_pages/create_change_new_workout_page/widgets/app_bar_create_change_workout.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

class CreateWorkoutPage extends StatelessWidget {
  static const id = '/create_workout_page';

  CreateWorkoutPage({Key? key, this.sportsWorkoutModelForEdit})
      : super(key: key);

  SportsWorkoutModel? sportsWorkoutModelForEdit; //для редактирования тренировки

  final controllerSetting = Get.find<ImplementSettingGetXController>();

  @override
  Widget build(BuildContext context) {
    bool isSportWorkoutEdit =
        sportsWorkoutModelForEdit != null; //true - если нужно отредактировать

    String idWorkout = isSportWorkoutEdit
        ? sportsWorkoutModelForEdit!.idWorkout
        : CreateAndChangeSportWorkoutControllerGetxState.instance.idWorkout;

    return Scaffold(
      appBar: isSportWorkoutEdit //если редактировать тренировку
          ? appBarCreatePage(idWorkout: idWorkout, isSportWorkoutEdit: true)
          : appBarCreatePage(idWorkout: idWorkout),
      // endDrawer: MyEndDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isSportWorkoutEdit
              ? IfEditSportWorkout(
                  sportsWorkoutModelForEdit: sportsWorkoutModelForEdit!)
              : IfNewCreateSportWorkout(idWorkout: idWorkout),
        ),
      ),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
