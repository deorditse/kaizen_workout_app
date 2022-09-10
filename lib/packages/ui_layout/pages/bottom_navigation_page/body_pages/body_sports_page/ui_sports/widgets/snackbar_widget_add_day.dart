import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';

snackBarAddSelectSay(context) {
  return Get.snackbar("Еще один шаг выполнен!", "",
      duration: Duration(milliseconds: 1900),
      backgroundColor: myDefaultDialogBackground(context),
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        "Еще один шаг выполнен!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline1,
      ),
      messageText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Отлично! Это было',
          style: Theme.of(context).textTheme.headline2,
          children: <TextSpan>[
            TextSpan(
              text: " 456 ",
              //${myListPageController.valueSelectDays.value} ",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'выполнение',
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ));
}
