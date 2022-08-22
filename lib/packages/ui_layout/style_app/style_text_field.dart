import 'package:flutter/material.dart';

InputDecoration myStyleTextField(BuildContext context,
    {labelText, hintText, helperText}) {
  Color myFieldColor = Theme.of(context).primaryColor;

  OutlineInputBorder myOutlineInputBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: myFieldColor, width: 1),
      );

  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 10,
    ),
    enabledBorder: myOutlineInputBorder(),
    focusedBorder: myOutlineInputBorder(),
    labelStyle: TextStyle(
      color: Theme.of(context).textTheme.headline2!.color,
    ),
    labelText: labelText,
    //'Введите ключ команды',
    helperText: helperText,
    //'Поле для поиска заметок',
    hintText: hintText, //'123456',
  );
}

ButtonStyle myButtonStyle({context, Color? buttonBackground}) {
  Color myButtonColor = Theme.of(context).primaryColor;

  return ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
    foregroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
    backgroundColor:
        MaterialStateProperty.all(buttonBackground ?? myButtonColor),
  );
}
