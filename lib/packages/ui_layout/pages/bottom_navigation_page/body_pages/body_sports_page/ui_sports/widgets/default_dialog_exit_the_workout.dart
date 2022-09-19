import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:style_app/style_app.dart';

//
// class DefaultDialogExitTheWorkout extends StatefulWidget {
//   const DefaultDialogExitTheWorkout({Key? key}) : super(key: key);
//
//   @override
//   State<DefaultDialogExitTheWorkout> createState() =>
//       _DefaultDialogExitTheWorkoutState();
// }
//
// class _DefaultDialogExitTheWorkoutState
//     extends State<DefaultDialogExitTheWorkout> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

void defaultDialogExitTheWorkout(
    {required BuildContext context, required String idWorkout}) {
  Get.defaultDialog(
    barrierDismissible: false,

    backgroundColor: myDefaultDialogBackground(context),
    //backColorAlertDialog,
    content: _homeDialogFromCalendarPage(context, idWorkout),
    title: "",
  ).then((value) => print(value));
}

Widget _homeDialogFromCalendarPage(BuildContext context, idWorkout) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Text(
          "Хотите выйти из тренировки?",
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
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
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.close(0);
            },
            child: Text(
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
            child: Text(
              "Да",
            ),
          ),
        ],
      ),
    ],
  );
}
