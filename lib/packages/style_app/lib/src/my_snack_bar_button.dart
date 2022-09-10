import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/style_app/lib/src/consts_app.dart';

mySnackBarButton({
  BuildContext? context,
  required String title,
  required String message,
}) {
  Get.snackbar(
    "",
    "",
    backgroundColor: myDefaultDialogBackground(context),
    messageText: Text(
      message,
      textAlign: TextAlign.center,
      style: context != null ? Theme.of(context).textTheme.headline2 : null,
    ),
    titleText: Text(
      title,
      textAlign: TextAlign.center,
      style: context != null ? Theme.of(context).textTheme.headline1 : null,
    ),
    // messageText: null,
    snackPosition: SnackPosition.BOTTOM,
  );
}
