import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/consts_app.dart';
import 'package:kaizen/packages/model/lib/model.dart';

adminPopupWithUsersInWorkout({
  required context,
  required String nameWorkout,
  required Set<User> usersInWorkout,
}) {
  return Get.defaultDialog(
  backgroundColor: myDefaultDialogBackground(context),
    titlePadding: EdgeInsets.only(
      top: 20,
    ),
    title: "Список участников\n$nameWorkout",
    // content: Text(usersInWorkout.cast().toList().toString()),
    content: Container(
      height: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...usersInWorkout
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
                    subtitle: Text('${user.email}'),
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

      // ListView(
      //   children: [
      //     Text('hello'),
      //     //
      //   ],
      // ),
    ),
    // titleStyle: const TextStyle(
    //   color: Colors.white70,
    //   fontSize: 16,
    // ),
  );
}
