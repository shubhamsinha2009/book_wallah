import 'package:flutter/material.dart';

class Themes {
  static final ThemeData appDarkTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    chipTheme: const ChipThemeData(
        backgroundColor: Colors.black,
        disabledColor: Colors.transparent,
        selectedColor: Colors.black,
        secondarySelectedColor: Colors.black,
        padding: EdgeInsets.all(5),
        shape: StadiumBorder(side: BorderSide(color: Colors.white)),
        labelStyle: TextStyle(color: Colors.white),
        secondaryLabelStyle: TextStyle(color: Colors.white),
        brightness: Brightness.dark),
    dividerColor: Colors.white,
    dividerTheme: const DividerThemeData(color: Colors.white),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      prefixIconColor: Colors.white,
      hoverColor: Colors.white,
      filled: true,
      focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      labelStyle: TextStyle(color: Colors.white),
    ),
    disabledColor: Colors.white,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.black,
        modalBackgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    canvasColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
    ),
    cardColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: Colors.black,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white70,
        backgroundColor: Colors.white10,
        shadowColor: Colors.grey.shade900,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white70,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(backgroundColor: Colors.black),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
    ),
  );

  static final ThemeData appLightTheme = ThemeData(
    brightness: Brightness.light,
    // primaryColor: Colors.red,
    // canvasColor: Colors.red,
    // appBarTheme: const AppBarTheme(
    //   color: Colors.red,
    // ),
    //scaffoldBackgroundColor: Colors.redAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Colors.blue,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      prefixIconColor: Colors.black,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      labelStyle: TextStyle(color: Colors.black),
    ),
  );

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
}
