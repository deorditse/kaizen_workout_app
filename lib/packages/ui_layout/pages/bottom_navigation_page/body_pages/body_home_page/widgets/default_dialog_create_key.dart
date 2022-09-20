import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:style_app/style_app.dart';

defaultDialogAboutSports({required BuildContext context, String? idWorkout}) {
  return Get.defaultDialog(
    barrierDismissible: false,
    // titlePadding: EdgeInsets.only(top: 0),
    //  contentPadding: EdgeInsets.only(top: 15),
    // barrierDismissible: false,

    backgroundColor: myDefaultDialogBackground(context),
    titlePadding: EdgeInsets.zero,
    // backgroundColor: backColorAlertDialog,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        // FaIcon(
        //   FontAwesomeIcons.info,
        //   size: 15,
        // ),
        Text(
          'Тренировка создана',
          style: Theme.of(context).textTheme.headline1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Center(
            child: Text(
              'Чтобы ваши друзья могли присоединиться к тренировке, отправьте этот ключ',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SelectableText(
            idWorkout ?? 'нет данных',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: 28,
                ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          onPressed: () {
            Get.close(0);
            Get.back();
            CreateAndChangeSportWorkoutControllerGetxState.instance
                .clearAllDataInNewSportWorkout();
          },
          child: Text(
            "прекрасно!",
            style: Theme.of(context).textTheme.headline2,
          ),
          //style: myButtonStyleFromShowDialog(),
        ),
      ],
    ),
    title: "",
    titleStyle: Theme.of(context).textTheme.headline1,
  );
}
