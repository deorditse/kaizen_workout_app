import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/model/lib/model.dart';

SliverAppBar mySliverSportsAppBar(context) {
  ImplementAppStateGetXController controllerApp = Get.find();

  return SliverAppBar(
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    leading: IconButton(
      icon: FittedBox(
        child: Icon(
          Icons.arrow_back_ios_new,
          // size: 10,
          color: Theme.of(context).textTheme.headline6!.color,
        ),
      ),
      onPressed: () {
        ImplementSettingGetXController controllerSetting = Get.find();
        controllerSetting.currentTabIndex.value = 0;
      },
    ),
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
    title: GetBuilder<ImplementAppStateGetXController>(
      builder: (_) => Text(
        'Тренировка ${controllerApp.dataSportsWorkoutList.isNotEmpty ? 'id ${controllerApp.dataSportsWorkoutList[controllerApp.indexWorkoutList.value].idWorkout}' : ''}',
        style: Theme.of(context).textTheme.headline1,
      ),
    ),
    toolbarHeight: 35,
    floating: true,
    pinned: true,
    // title: Text(
    //   'Чат',
    //   style: TextStyle(color: Theme.of(context).textTheme.headline1!.color),
    // ),
  );
}

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
