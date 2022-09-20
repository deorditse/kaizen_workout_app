import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:business_layout/business_layout.dart';
import 'package:model/model.dart'; //только так работает, так как на слое данных такой импорт - нужно чтобы совподало

keyNameAndChat({required context, required int index, bool? isAdmin}) {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  SportsWorkoutModel sportWorkout = (isAdmin == null && isAdmin != true)
      ? ImplementAppStateGetXController.instance.dataSportsWorkoutList[index]!
      : ImplementAppStateGetXController
          .instance.dataSportsWorkoutListWhenIAdmin[index];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        flex: 1,
        child: FittedBox(
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: SelectableText(
                  sportWorkout.idWorkout,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.left,
                ),
              ),
              Text(
                'ключ',
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
      Flexible(
        flex: 4,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            sportWorkout.nameWorkout.toString() ?? '',
            style: Theme.of(context).textTheme.headline2,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            controllerSetting.currentTabIndex.value = 2;
          },
          child: FittedBox(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  FontAwesomeIcons.message,
                  color: Theme.of(context)
                      .primaryColor, //textTheme.headline3!.color,
                  size: 15,
                ),
                Text(
                  'чат',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
