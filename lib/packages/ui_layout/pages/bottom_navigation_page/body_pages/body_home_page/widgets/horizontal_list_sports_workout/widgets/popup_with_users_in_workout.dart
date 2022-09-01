import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';

import '../../../../../../../../model/lib/model.dart';

popupWithUsersInWorkout({
  required context,
  required int index,
  required bool isAdmin,
}) {
  final sportWorkout = isAdmin
      ? ImplementAppStateGetXController
          .instance.dataSportsWorkoutListWhenIAdmin[index]
      : ImplementAppStateGetXController.instance.dataSportsWorkoutList[index];

  return Get.defaultDialog(
    backgroundColor: myDefaultDialogBackground(context),
    titlePadding: EdgeInsets.only(
      top: 20,
    ),
    title: "Список участников\n${sportWorkout.nameWorkout}",
    // content: Text(usersInWorkout.cast().toList().toString()),
    content: Container(
      height: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...sportWorkout.usersInWorkout!
                .cast()
                .map(
                  (user) => ListTile(
                    hoverColor: Colors.yellow,
                    focusColor: Colors.red,
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/1200/501',
                        // fit: BoxFit.cover,
                      ),
                    ),
                    title: Text('${user.name} ${user.family}'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      print('hello');
                    },
                  ),
                )
                .toSet(),
          ],
        ),
      ),
    ),
    titleStyle: Theme.of(context).textTheme.headline1,
    // middleTextStyle
  );
}
