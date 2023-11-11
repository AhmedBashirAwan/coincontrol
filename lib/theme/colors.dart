// ignore_for_file: non_constant_identifier_names

import 'package:coincontrol/imports.dart';

Color LIGHT_COLOR = Colors.white;
Color LIGHT_SEC_COLOR = const Color(0xFFAF6B58);
Color LIGHT_PRI_COLOR = const Color(0xFFEFE1DD);
Color LIGHT_CARDS = const Color(0xFFCBBCB1);

const MaterialColor PrimaryBlue =
    MaterialColor(_prmarybluePrimaryValue, <int, Color>{
  50: Color(0xFFE2EAF0),
  100: Color(0xFFB6CADA),
  200: Color(0xFF85A6C1),
  300: Color(0xFF5482A8),
  400: Color(0xFF2F6895),
  500: Color(_prmarybluePrimaryValue),
  600: Color(0xFF09467A),
  700: Color(0xFF073D6F),
  800: Color(0xFF053465),
  900: Color(0xFF032552),
});
const int _prmarybluePrimaryValue = 0xFF0A4D82;

const MaterialColor prmaryblueAccent =
    MaterialColor(_prmaryblueAccentValue, <int, Color>{
  100: Color(0xFF85AFFF),
  200: Color(_prmaryblueAccentValue),
  400: Color(0xFF1F6DFF),
  700: Color(0xFF055CFF),
});
const int _prmaryblueAccentValue = 0xFF528EFF;
