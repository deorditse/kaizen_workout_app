import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kaizen/packages/ui_layout/pages/bottom_navigation_page/body_pages/body_sports_page/old/pages/Test_calendars_page/controller/calendar_page_controller.dart';

Color backColorAlertDialog = Colors.black26;
Color titleColorAlertDialog = Colors.white;
double fontSizeShowDialog = 15;
Color buttonStateColor = Colors.green;
Color? buttonStateColorChoise = Colors.green.withOpacity(0.7);
EdgeInsets paddingAvatars = const EdgeInsets.only(top: 8, bottom: 6);

TextEditingController controllerTextFieldUp =
    TextEditingController(text: "...");

void styleButton() {
  BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20));
}

TextStyle myTextStyleCheckBox([myColor]) {
  return TextStyle(
    color: myColor != null ? myColor : Colors.grey,
    //fontWeight: FontWeight.bold,
  );
}

TableBasicsController colorController = Get.find<TableBasicsController>();

BoxDecoration myBoxDecorationtyleCheckBox([myColor, myBorderStyle]) {
  return BoxDecoration(
    border: myBorderStyle!
        ? Border.all(
            color: colorController.myStateColorCheckBox.value,
            width: 2,
            style: BorderStyle.solid)
        : Border.all(
            color: Colors.green.shade200,
            width: 1,
            style: BorderStyle.solid,
          ),
    color:
        myColor != null ? myColor : colorController.myStateColorCheckBox.value,
    borderRadius: BorderRadius.circular(100),
    boxShadow: [
      BoxShadow(
        color: myColor != null ? myColor : colorController.myStateColorCheckBox,
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  );
}

ButtonStyle myButtonStyleFromShowDialog() {
  return ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Colors.green.withOpacity(0.7)),
  );
}
