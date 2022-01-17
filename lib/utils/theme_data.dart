import 'package:finance_app/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData myThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: "Roboto",
    primaryColor: primaryColor,
    textTheme: Theme.of(context)
        .textTheme
        .apply(fontFamily: 'Roboto', fontSizeDelta: 1.5),
    primaryTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
    accentTextTheme: Theme.of(context).textTheme.apply(fontFamily: 'Roboto'),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    canvasColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      brightness: Brightness.light,
      elevation: 2,
      color: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: "Roboto",
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
