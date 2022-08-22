import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';

SliverAppBar mySliverSportsAppBar(context) => SliverAppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: [
        IconButton(
          onPressed: () {
            defaultDialogAboutSports(context: context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.info,
            size: 15,
          ),
          color: Theme.of(context).textTheme.headline6!.color,
        ),
      ],
      toolbarHeight: 35,
      floating: true,
      pinned: true,
      // title: Text(
      //   'Чат',
      //   style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
      // ),
    );

defaultDialogAboutSports({required context}) {
  return Get.defaultDialog(
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
        FaIcon(
          FontAwesomeIcons.info,
          size: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: Text(
            "Кайзен - это японская философия или практика, которая фокусируется на непрерывном каждодневном совершенствовании своих задач и себя, через выполнение маленьких шагов",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextButton(
          onPressed: () {
            // funcLigicButtonPress();
            return Get.close(1);
          },
          child: Text(
            "прекрасно!",
            style: Theme.of(context).textTheme.headline3,
          ),
          //style: myButtonStyleFromShowDialog(),
        ),
      ],
    ),
    title: "",
  );
}
