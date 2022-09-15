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
      FittedBox(
        child: Text(
          'Ключ \n${sportWorkout.idWorkout}',
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        flex: 3,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            sportWorkout?.nameWorkout.toString() ?? '',
            style: Theme.of(context).textTheme.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        flex: 1,
        child: FittedBox(
          child: GestureDetector(
            onTap: () {
              controllerSetting.currentTabIndex.value = 2;
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  FontAwesomeIcons.message,
                  color: Theme.of(context).primaryColor,
                ),
                const Text('Group chat'),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
