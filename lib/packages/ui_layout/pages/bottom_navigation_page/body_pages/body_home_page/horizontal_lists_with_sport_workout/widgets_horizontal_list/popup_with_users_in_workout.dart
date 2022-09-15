import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/business_layout/lib/business_layout.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';
import 'package:model/model.dart'; //только так работает, так как на бизнес слое такой импорт - нужно чтобы совподало

popupWithUsersInWorkout({
  required context,
  required int index,
  required bool isAdmin,
}) {
  SportsWorkoutModel? sportWorkout = isAdmin
      ? ImplementAppStateGetXController
          .instance.dataSportsWorkoutListWhenIAdmin[index]
      : ImplementAppStateGetXController.instance.dataSportsWorkoutList[index];

  return Get.defaultDialog(
    backgroundColor: myDefaultDialogBackground(context),
    titlePadding: EdgeInsets.zero,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // FaIcon(
        //   FontAwesomeIcons.info,
        //   size: 15,
        // ),
        if (sportWorkout != null)
          Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Список участников",
                style: Theme.of(context).textTheme.headline1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  "${sportWorkout.nameWorkout}",
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Divider(),
            ],
          ),

        SizedBox(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: sportWorkout?.usersInWorkout != null
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Админ",
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            FittedBox(
                              child: Text(
                                "права редактирования",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        style: ListTileStyle.drawer,
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/1200/501',
                            // fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                            '${sportWorkout!.adminWorkout.name} ${sportWorkout.adminWorkout.family ?? ''}'),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          print('hello');
                        },
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Участники",
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      ...sportWorkout.usersInWorkout
                          .map((NameAndPhotoUser user) {
                        return (user != sportWorkout.adminWorkout)
                            ? ListTile(
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
                              )
                            : Container();
                      }).toSet(),
                    ],
                  ),
                )
              : const Center(
                  child: Text('Ошибка получения данных'),
                ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            Get.close(0);
          },
          child: Text(
            "id ${sportWorkout!.idWorkout}",
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    ),
    title: "",
    contentPadding: EdgeInsets.zero,
    titleStyle: Theme.of(context).textTheme.headline1,
    // middleTextStyle
  );
}
