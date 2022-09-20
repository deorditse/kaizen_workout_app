import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';

void defaultDialogExitTheWorkout(
    {required BuildContext context, required String idWorkout}) {
  Get.defaultDialog(
    backgroundColor: myDefaultDialogBackground(context),
    content: _homeDialogFromCalendarPage(context, idWorkout),
    title: "",
    titlePadding: EdgeInsets.zero,
  ).then((value) => print(value));
}

Widget _homeDialogFromCalendarPage(BuildContext context, idWorkout) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "Хотите выйти из тренировки?",
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 5),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FittedBox(
          child: Text(
            "Вся статистика будет удалена",
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.close(0);
            },
            child: const Text(
              "Нет",
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          ElevatedButton(
            onPressed: () {
              ImplementAppStateGetXController.instance
                  .exitTheWorkout(idWorkout: idWorkout, context: context);
              Get.close(0);
            },
            child: const Text(
              "Да",
            ),
          ),
        ],
      ),
    ],
  );
}
