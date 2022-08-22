import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.green,
    toolbarHeight: 26,
    title: const Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        'KAIZEN',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    ),
    actions: [
      IconButton(
        iconSize: 20,
        tooltip: 'About',
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(bottom: 10, right: 5),
        icon: Icon(
          CupertinoIcons.info,
          size: 18,
        ),
        onPressed: () {
          Get.defaultDialog(
            backgroundColor: Colors.white.withOpacity(0.7),
            titlePadding: EdgeInsets.only(
              top: 20,
            ),
            title: "Для чего исполюзуется Кайзен?",
            content: const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "Кайзен - это японская философия или практика, которая фокусируется на непрерывном каждодневном совершенствовании своих задач и себя, через выполнение маленьких шагов",
                textAlign: TextAlign.center,
                style: TextStyle(),
              ),
            ),
            titleStyle: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          );
        },
      ),
    ],
  );
}
