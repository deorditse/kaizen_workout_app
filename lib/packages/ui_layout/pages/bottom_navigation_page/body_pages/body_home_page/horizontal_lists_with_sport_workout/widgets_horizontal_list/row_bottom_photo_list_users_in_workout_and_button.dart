import 'package:flutter/material.dart';
import 'package:business_layout/business_layout.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_home_page/horizontal_lists_with_sport_workout/widgets_horizontal_list/popup_with_users_in_workout.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

rowWithListUsersAndButton({
  required int index,
  required context,
  required constrains,
  bool? isAdmin,
}) {
  final controllerApp = ImplementAppStateGetXController.instance;

  Set<NameAndPhotoUser> usersInWorkout = (isAdmin != null && isAdmin)
      ? controllerApp.dataSportsWorkoutListWhenIAdmin[index].usersInWorkout
      : controllerApp.dataSportsWorkoutList[index]!.usersInWorkout;

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        // flex: 2,
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
                'Участников ${usersInWorkout.length + 1}',
                //+ 1 - this is admin workout
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 3,
              ),
              _photoListUsersInWorkout(
                constrains: constrains,
                context: context,
                index: index,
                isAdmin: isAdmin,
              ),
              // Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
      FittedBox(
        child: TextButton(
          onPressed: () {
            //меняю отслеживание id тренировки
            if (isAdmin == null) {
              ImplementAppStateGetXController.instance.indexWorkoutList.value =
                  index;
            } else if (isAdmin == true) {
              //нужно найти какому индексу в dataSportsWorkoutList соответсвует ииндекс из dataSportsWorkoutListWhenIAdmin
              ImplementAppStateGetXController.instance
                  .updateIndexForDataSportsWorkoutList(
                      indexFromDataSportsWorkoutListWhenIAdmin: index);
            }
            //переходим на страницу календаря
            ImplementSettingGetXController.instance.currentTabIndex.value = 1;
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'к тренировке',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ),
    ],
  );
}

_photoListUsersInWorkout({
  required constrains,
  required int index,
  required BuildContext context,
  bool? isAdmin,
}) {
  final controllerApp = ImplementAppStateGetXController.instance;

  SportsWorkoutModel? sportsWorkoutModel = (isAdmin != null && isAdmin)
      ? controllerApp.dataSportsWorkoutListWhenIAdmin[index]
      : controllerApp.dataSportsWorkoutList[index]!;
  Set<NameAndPhotoUser> usersInWorkout = sportsWorkoutModel.usersInWorkout;
  return SizedBox(
    height: constrains.maxHeight / 7,
    child: usersInWorkout != null
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: usersInWorkout.length ?? 1,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  if (usersInWorkout != null && index == 0)
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: CircleAvatar(
                        radius: constrains.maxHeight / 12,
                        backgroundImage: AssetImage(
                          sportsWorkoutModel.adminWorkout.photoPath ??
                              'assets/images/anonim.png',
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: CircleAvatar(
                      radius: constrains.maxHeight / 12,
                      backgroundImage: AssetImage(
                        usersInWorkout.elementAt(index).photoPath ??
                            'assets/images/anonim.png',
                      ),
                    ),
                  ),
                  if (usersInWorkout != null &&
                      index == usersInWorkout!.length - 1)
                    const FittedBox(child: Icon(Icons.arrow_forward_ios)),
                ],
              );
            })
        : Text(
            'no users',
            style: Theme.of(context).textTheme.headline3,
          ),
  );
}
