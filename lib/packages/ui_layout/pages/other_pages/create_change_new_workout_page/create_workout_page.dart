import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/body_if_edit_sport_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/body_if_new_create_sport_workout.dart';
import 'package:kaizen/packages/ui_layout/pages/other_pages/create_change_new_workout_page/widgets/app_bar_create_change_workout.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало
import 'package:business_layout/business_layout.dart';

class CreateWorkoutPage extends StatefulWidget {
  static const id = '/create_workout_page';

  const CreateWorkoutPage({super.key, this.indexInWorkoutList});

  final int? indexInWorkoutList;

  @override
  State<CreateWorkoutPage> createState() => _CreateWorkoutPageState();
}

class _CreateWorkoutPageState extends State<CreateWorkoutPage> {
  //для редактирования принимаю переданные аргументы при переходе на эту страницу
  SportsWorkoutModel? sportsWorkoutModelForEdit;
  int? indexInDataSportsWorkoutListWhenIAdmin;

  @override
  void initState() {
    super.initState();
    sportsWorkoutModelForEdit = Get.arguments[0];
    indexInDataSportsWorkoutListWhenIAdmin = Get.arguments[1];
    print('initState');

    if (sportsWorkoutModelForEdit != null) {
      //если нажата кнопка редактирования
      CreateAndChangeSportWorkoutControllerGetxState.instance
          .editSportWorkoutFromEditWorkoutPage(
              sportsWorkoutModelForEdit: sportsWorkoutModelForEdit!);
    }
  }

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
                  sportsWorkoutModelForEdit: sportsWorkoutModelForEdit!,
                  indexInDataSportsWorkoutListWhenIAdmin:
                      indexInDataSportsWorkoutListWhenIAdmin!)
              : IfNewCreateSportWorkout(),
        ),
      ),
      // bottomNavigationBar: MyBottomNavigatorBar(),
    );
  }
}
