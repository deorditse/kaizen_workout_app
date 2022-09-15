import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/setting_controller/implement_getx_state_management.dart';

keyNameAndChat({required context, required int index, bool? isAdmin}) {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  final sportWorkout = (isAdmin == null && isAdmin != true)
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
            mainAxisSize: MainAxisSize.min,
            children: [
              FittedBox(
                child: SelectableText(
                  sportWorkout.idWorkout,
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              Text(
                'ключ',
                style: Theme.of(context).textTheme.headline3,
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
