import 'package:flutter/material.dart';

///Theme Material Dark__________________________________________________________________________________________________________________________________________
ThemeData _themeDark = ThemeData.dark();
ThemeData themeDark = _themeDark.copyWith(
  //будут использоватьчя базовые темы и перезаписаны только те части которые нам необходимы
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    toolbarHeight: 40,
    color: Colors.greenAccent.withOpacity(0.5),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle().copyWith(
      // backgroundColor: MaterialStatePropertyAll(Colors.green),
      foregroundColor: MaterialStatePropertyAll(Colors.greenAccent),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle().copyWith(
      backgroundColor: MaterialStatePropertyAll(Colors.greenAccent.withOpacity(0.7)),
      foregroundColor: MaterialStatePropertyAll(Colors.white70),
    ),
  ),
  primaryColor: Colors.greenAccent,

  textTheme: _textDart(_themeDark.textTheme),
  //_themeLight.textTheme - какую базу будем перезаписывать
);

TextTheme _textDart(TextTheme baseTextThemeDark) {
  //base - нащ базовый стиль
  return baseTextThemeDark.copyWith(
    headline1: baseTextThemeDark.headline1?.copyWith(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    headline2: baseTextThemeDark.headline2?.copyWith(
      color: Colors.white70,
      fontSize: 16,
    ),
    headline3: baseTextThemeDark.headline3?.copyWith(
      color: Colors.white38,
      fontSize: 14,
    ),
    bodyText1: baseTextThemeDark.bodyText1?.copyWith(
      color: Colors.greenAccent,
    ),
    bodyText2: baseTextThemeDark.bodyText2?.copyWith(
      color: Colors.white70, //для дефолтного текста
    ),
  );
}
