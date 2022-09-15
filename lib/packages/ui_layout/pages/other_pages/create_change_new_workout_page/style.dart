import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

DatePickerTheme? myDatePickerTheme(BuildContext context) => DatePickerTheme(
      backgroundColor: Theme.of(context).cardColor,
      doneStyle: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(color: Theme.of(context).primaryColor),
      cancelStyle: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(color: Theme.of(context).primaryColor),
      itemStyle: Theme.of(context).textTheme.headline2!,
      // containerHeight: 180,
    );
