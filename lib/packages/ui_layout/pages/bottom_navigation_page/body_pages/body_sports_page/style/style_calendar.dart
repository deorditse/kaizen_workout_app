import 'package:flutter/material.dart';
import 'package:get/get.dart';

EdgeInsets paddingAvatars = const EdgeInsets.only(top: 8, bottom: 6);
Color backColorAlertDialog = Colors.black26;
Color titleColorAlertDialog = Colors.white;
double fontSizeShowDialog = 15;

BoxDecoration myBoxDecorationtyleCheckBox([myColor, myBorderStyle]) {
  return BoxDecoration(
    border: myBorderStyle!
        ? Border.all(
            color: Colors.green, // colorController.myStateColorCheckBox.value,
            width: 2,
            style: BorderStyle.solid)
        : Border.all(
            color: Colors.green.shade200,
            width: 1,
            style: BorderStyle.solid,
          ),
    color: myColor != null ? myColor : Colors.green,
    //colorController.myStateColorCheckBox.value,
    borderRadius: BorderRadius.circular(100),
    boxShadow: [
      BoxShadow(
        color: myColor != null ? myColor : Colors.green,
        //: colorController.myStateColorCheckBox,
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  );
}

TextStyle myTextStyleCheckBox([myColor]) {
  return TextStyle(
    color: myColor != null ? myColor : Colors.grey,
    //fontWeight: FontWeight.bold,
  );
}

Transition myTransitionDownToUp() => Transition.downToUp;
