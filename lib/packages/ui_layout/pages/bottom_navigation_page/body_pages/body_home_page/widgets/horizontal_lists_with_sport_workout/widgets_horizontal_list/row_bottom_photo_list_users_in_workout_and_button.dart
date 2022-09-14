import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/app_controller/implement_getx_state_management.dart';
import 'package:kaizen/packages/business_layout/lib/src/getX/getx_controllers/setting_controller/implement_getx_state_management.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/widgets/horizontal_lists_with_sport_workout/widgets_horizontal_list/widgets/popup_with_users_in_workout.dart';

rowWithListUsersAndButton({
  required int index,
  required context,
  required usersInWorkout,
  required constrains,
  bool? buttonIsDelete,
  bool? isAdmin,
}) {
  final controllerSetting = Get.find<ImplementSettingGetXController>();

  return Row(
    children: [
      Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: () {
            popupWithUsersInWorkout(
              context: context,
              index: index,
              isAdmin: isAdmin ?? false,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Участников ${usersInWorkout?.length ?? ''}',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 3,
              ),
              _photoListUsersInWorkout(
                constrains: constrains,
                usersInWorkout: usersInWorkout,
                context: context,
              ),
              // Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      if (buttonIsDelete == null)
        TextButton(
          onPressed: () {
            //меняю отслеживание id тренировки
            ImplementAppStateGetXController.instance.indexWorkoutList.value =
                index;
            //переходим на страницу календаря
            controllerSetting.currentTabIndex.value = 1;
          },
          child: FittedBox(
            child: Text(
              'к тренировке',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
    ],
  );
}

_photoListUsersInWorkout({
  required constrains,
  required usersInWorkout,
  required context,
}) {
  return SizedBox(
    height: constrains.maxHeight / 7,
    child: usersInWorkout != null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: usersInWorkout?.length ?? 1,
            itemBuilder: (context, index) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: CircleAvatar(
                    radius: constrains.maxHeight / 12,
                    backgroundImage: const NetworkImage(
                      'https://picsum.photos/1200/501',
                    ),
                  ),
                ),
                if (usersInWorkout != null &&
                    index == usersInWorkout!.length - 1)
                  const Icon(Icons.arrow_forward_ios),
              ],
            ),
          )
        : Text(
            'no users',
            style: Theme.of(context).textTheme.headline3,
          ),
  );
}
