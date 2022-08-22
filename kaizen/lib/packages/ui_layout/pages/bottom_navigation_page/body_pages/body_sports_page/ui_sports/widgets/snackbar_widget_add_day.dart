import 'package:flutter/material.dart';
import 'package:get/get.dart';

snackBarAddSelectSay() {
  return Get.snackbar("Еще один шаг выполнен!", "",
      duration: Duration(milliseconds: 1900),
      backgroundColor: Colors.black45,
      snackPosition: SnackPosition.BOTTOM,
      titleText: const Text(
        "Еще один шаг выполнен!",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Отлично! Это было',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "456789",
              //${myListPageController.valueSelectDays.value} ",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'выполнение',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ));
}
