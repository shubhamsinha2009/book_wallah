import 'package:flutter/material.dart';

class Themes {
  static final ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
    ),
    chipTheme: const ChipThemeData(
      // backgroundColor: Colors.white,
      // disabledColor: Colors.transparent,
      //selectedColor: Colors.white,
      // secondarySelectedColor: Colors.white,
      // padding: EdgeInsets.all(5),
      //  shape: StadiumBorder(side: BorderSide(color: Colors.white)),
      //labelStyle: TextStyle(color: Colors.white),
      secondaryLabelStyle: TextStyle(color: Colors.black),
    ),
    navigationBarTheme: const NavigationBarThemeData(elevation: 0),
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
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.grey.shade800,
        modalBackgroundColor: Colors.grey.shade900,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.black,
    canvasColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.black,
    ),
    cardColor: Colors.black,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //   backgroundColor: Colors.black,
    //   foregroundColor: Colors.white,
    // ),
    // popupMenuTheme: const PopupMenuThemeData(
    //   color: Colors.black,
    // ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        backgroundColor: Colors.white10,
        shadowColor: Colors.grey.shade900,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
        backgroundColor: Colors.white10,
        shadowColor: Colors.grey.shade900,
      ),
    ),
    checkboxTheme: CheckboxThemeData(
        checkColor:
            MaterialStateColor.resolveWith((states) => getColor(states))),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white70,
      ),
    ),
    dialogBackgroundColor: Colors.grey.shade900,
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey.shade900,
    ),
    snackBarTheme: SnackBarThemeData(backgroundColor: Colors.grey.shade900),
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
    ),
  );

  static final ThemeData appLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.grey.shade200,
        modalBackgroundColor: Colors.grey.shade200,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    // primaryColor: Colors.red,
    // canvasColor: Colors.red,
    // appBarTheme: const AppBarTheme(
    //     color: Colors.white,
    //     titleTextStyle: TextStyle(
    //         color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
    //     iconTheme: IconThemeData(color: Colors.black),
    //     elevation: 0),
    // chipTheme: const ChipThemeData(
    // backgroundColor: Colors.white,
    // disabledColor: Colors.transparent,
    // selectedColor: Colors.white,
    // secondarySelectedColor: Colors.white,
    //padding: EdgeInsets.all(5),

    //  secondaryLabelStyle: TextStyle(color: Colors.white),
    // ),

    navigationBarTheme: const NavigationBarThemeData(elevation: 0),
    colorScheme: const ColorScheme.light().copyWith(outline: Colors.black),
    dividerColor: Colors.black,
    dividerTheme: const DividerThemeData(color: Colors.black),
    // scaffoldBackgroundColor: Colors.redAccent,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.grey.shade200,
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
    // bottomSheetTheme: const BottomSheetThemeData(
    //     backgroundColor: Colors.black54,
    //     modalBackgroundColor: Colors.black54,
    //     shape: RoundedRectangleBorder(
    //         borderRadius: BorderRadius.only(
    //             topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateColor.resolveWith((states) => getColor(states)))),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor:
                MaterialStateColor.resolveWith((states) => getColor(states)))),
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
}

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.black87;
}
