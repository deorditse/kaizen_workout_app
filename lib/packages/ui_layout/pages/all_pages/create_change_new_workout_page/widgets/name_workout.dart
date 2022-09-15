import 'package:flutter/material.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';

Widget nameWorkout({required idWorkout, required context}) {

  final controllerCreateNewWorkout =
      CreateAndChangeSportWorkoutControllerGetxState.instance;

  TextEditingController _controller =
      TextEditingController(text: controllerCreateNewWorkout.nameWorkout);

  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: TextField(
      controller: _controller,
      onChanged: (value) {
        //обновление имени тренировки
        controllerCreateNewWorkout.updateNameWorkout(
            newNameSportWorkout: value);
      },
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
      decoration: myStyleTextField(
        context,
        labelText: 'Название тренировки',
        hintText: 'Введите название',
      ),
    ),
  );
}
