import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';

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
    titlePadding: const EdgeInsets.only(
      top: 20,
    ),
    title: sportWorkout != null
        ? "Список участников ${sportWorkout.idWorkout}\n${sportWorkout.nameWorkout}"
        : "error",
    // content: Text(usersInWorkout.cast().toList().toString()),
    content: SizedBox(
        height: MediaQuery.of(context).size.width,
        child: sportWorkout != null
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    ...sportWorkout.usersInWorkout!
                        .cast()
                        .map(
                          (user) => ListTile(
                            hoverColor: Colors.yellow,
                            focusColor: Colors.red,
                            leading: const CircleAvatar(
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
              )
            : const Center(
                child: Text('error'),
              )),
    titleStyle: Theme.of(context).textTheme.headline1,
    // middleTextStyle
  );
}
