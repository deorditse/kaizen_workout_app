import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:style_app/style_app.dart';

defaultDialogWorkoutSearch(
    {required BuildContext context, required String? idWorkout}) {
  bool isIdWorkout = (idWorkout != null && idWorkout != '') ? true : false;
  return Get.defaultDialog(
    barrierDismissible: !isIdWorkout,
    backgroundColor: myDefaultDialogBackground(context),
    titlePadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    content: isIdWorkout
        ? _ifIsIdWorkout(context: context, idWorkout: idWorkout)
        : _ifNotIdWorkout(context: context),
    title: "",
    titleStyle: Theme.of(context).textTheme.headline1,
  );
}

_ifIsIdWorkout({required BuildContext context, required String idWorkout}) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, bottom: 8, right: 18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        // FaIcon(
        //   FontAwesomeIcons.info,
        //   size: 15,
        // ),
        Text(
          'Поиск тренировки',
          style: Theme.of(context).textTheme.headline1,
        ),
        Center(
          child: Text(
            'Чтобы ваши друзья могли присоединиться к тренировке, отправьте этот ключ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        FittedBox(
          child: SelectableText(
            idWorkout,
            textAlign: TextAlign.center,
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
          },
          child: Text(
            "понятно",
            style: Theme.of(context).textTheme.headline2,
          ),
          //style: myButtonStyleFromShowDialog(),
        ),
      ],
    ),
  );
}

_ifNotIdWorkout({required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.only(left: 18.0, bottom: 8, right: 18),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        // FaIcon(
        //   FontAwesomeIcons.info,
        //   size: 15,
        // ),
        Text(
          'Тренировка не найдена',
          style: Theme.of(context).textTheme.headline1,
        ),
        Center(
          child: Text(
            'Чтобы ваши друзья могли присоединиться к тренировке, отправьте этот ключ',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        FittedBox(
          child: SelectableText(
            'Некорректный ключ',
            textAlign: TextAlign.center,
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
          },
          child: Text(
            "понятно",
            style: Theme.of(context).textTheme.headline2,
          ),
          //style: myButtonStyleFromShowDialog(),
        ),
      ],
    ),
  );
}
