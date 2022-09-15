import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало
import 'package:flutter/material.dart';

class IfEditSportWorkout extends StatelessWidget {
  IfEditSportWorkout({required this.sportsWorkoutModelForEdit, Key? key})
      : super(key: key);
  SportsWorkoutModel sportsWorkoutModelForEdit;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
