import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kaizen/packages/style_app/lib/style_app.dart';

defaultDialogIfDayHasNotCome({required selectedDay, required context}) {
  return Get.defaultDialog(
    // titlePadding: EdgeInsets.only(top: 0),
    //  contentPadding: EdgeInsets.only(top: 15),
    // barrierDismissible: false,
    backgroundColor: myDefaultDialogBackground(context),
    // backgroundColor: backColorAlertDialog,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${DateFormat('d MMM').format(selectedDay)} еще не наступил(о)",
              style: Theme.of(context).textTheme.headline2,
            ),
            Icon(
              Icons.lock_open,
              color: Theme.of(context).primaryColor,
            ),
          ],
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
