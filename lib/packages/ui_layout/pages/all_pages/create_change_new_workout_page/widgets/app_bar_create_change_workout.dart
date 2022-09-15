import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';

AppBar appBarCreatePage({required idWorkout, bool? isSportWorkoutEdit}) {
  return AppBar(
    // leading: MyLeftDrawer.openLeftDrawer(),
    leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const FittedBox(child: Icon(Icons.arrow_back_ios_outlined))),
    title: FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          (isSportWorkoutEdit != null && isSportWorkoutEdit)
              ? 'Редактирование тренировки id: $idWorkout'
              : 'Создание тренировки id: $idWorkout',
        ),
      ),
    ),
    // actions: [
    //   FittedBox(child: Padding(
    //     padding: const EdgeInsets.only(right: 8.0),
    //     child: IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.battleNet)),
    //   )),
    // ],
  );
}
