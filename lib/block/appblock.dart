// ignore_for_file: unused_field, avoid_print

import 'package:flutter/material.dart';

import '../theme/colors.dart';

class ApplicationBloc extends ChangeNotifier {
  ApplicationBloc() {
    print("ApplicationBloc working...");
  }
  Brightness brightness = Brightness.light;
  changeTheme() {
    brightness =
        brightness == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }

  final List<Widget> _screen = const [];

  ThemeData getTheme() {
    if (brightness == Brightness.light) {
      return ThemeData(
          //colorSchemeSeed: PRIMARY_COLOR,
          useMaterial3: true,
          primarySwatch: PrimaryBlue,
          brightness: brightness,
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: LIGHT_PRI_COLOR),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent),
          colorScheme: ColorScheme.light(
              background: LIGHT_PRI_COLOR, primary: LIGHT_PRI_COLOR));
    } else {
      return ThemeData(
          useMaterial3: true,
          // colorSchemeSeed: PRIMARY_COLOR,
          brightness: brightness,
          primarySwatch: PrimaryBlue,
          checkboxTheme: CheckboxThemeData(
              checkColor: MaterialStateProperty.all(LIGHT_COLOR)),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(
                // backgroundColor: LIGHT_BODY_COLOR
                ),
          colorScheme: ColorScheme.dark(
              // background: DARK_BG_COLOR, primary: PRIMARY_COLOR
              ),
          appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.transparent,
            // backgroundColor: DARK_CARD_COLOR,
          ));
    }
  }

}
