import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../utils.dart';


class TableBasicsController extends GetxController {

  final myStateColorCheckBox = Colors.white54.obs;

  var myListNamePage = ["Страница 1"].obs;

  var indexMyArrayBody = 0.obs;

  var valueSelectDays = 0.obs;

  //save state my Home Page
  var myStringMessageTextFieldUp = "".obs;

  var myStringMessageTextFieldDown = "".obs;

  // var kFirstDay = DateTime(kToday.year, kToday.month-1, kToday.day).obs;
  // var kLastDay = DateTime(kToday.year + 2, kToday.month, kToday.day).obs;

  var kFirstDayList = [DateTime(kToday.year, kToday.month, kToday.day)].obs;
}
