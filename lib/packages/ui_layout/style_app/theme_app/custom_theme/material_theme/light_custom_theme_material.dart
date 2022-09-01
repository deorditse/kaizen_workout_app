import 'package:flutter/material.dart';

///Theme Material Light__________________________________________________________________________________________________________________________________________
Color colorHeadline2 = Colors.black87;
ThemeData _themeLight = ThemeData.light();
ThemeData themeLight = _themeLight.copyWith(
  scaffoldBackgroundColor: Colors.grey.shade100,
  backgroundColor: Colors.grey.shade100,
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  appBarTheme: AppBarTheme().copyWith(
    toolbarHeight: 35,
    color: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle().copyWith(
      backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle().copyWith(
      // backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStatePropertyAll(Colors.green),
    ),
  ),
  primaryColor: Colors.green,

  textTheme: _textLight(
      _themeLight.textTheme), //_themeLight.textTheme - что будем перезаписывать
);

TextTheme _textLight(TextTheme baseTextThemeLight) {
  //также берем за основу базовую тему baseTextTheme
  return baseTextThemeLight.copyWith(
    headline1: baseTextThemeLight.headline1?.copyWith(
      color: colorHeadline2,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headline2: baseTextThemeLight.headline2?.copyWith(
      color: colorHeadline2,
      fontSize: 16,
      // fontWeight: FontWeight.w500,
    ),
    headline3: baseTextThemeLight.headline3
        ?.copyWith(color: Colors.black38, fontSize: 14),
    bodyText1: baseTextThemeLight.bodyText1?.copyWith(
      color: Colors.green,
    ),
    bodyText2: baseTextThemeLight.bodyText2?.copyWith(
      color: Colors.black87, //для дефолтного текста
    ),
  );
}
