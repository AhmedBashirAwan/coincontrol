import 'package:google_fonts/google_fonts.dart';

import 'globals.dart';
import 'imports.dart';

getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

bool isDarkTheme(BuildContext context) {
  final appBloc =
      Provider.of<ApplicationBloc>(context, listen: false);
  return appBloc.brightness == Brightness.dark;
}

TextStyle textStyle(double size,
    [FontWeight? weight, Color? color, TextDecoration? decoration]) {
  color ??= Colors.black;
  weight ??= FontWeight.w500;
  return GoogleFonts.poppins(
      fontSize: size, fontWeight: weight, color: color, decoration: decoration);
}

TextStyle heading(double size) {
  return GoogleFonts.roboto(fontSize: size, fontWeight: FontWeight.bold);
}
