import 'package:coincontrol/imports.dart';

//method to get height through percentage
getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

//method to get width through percentage
getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//method to check weather darkmode is enabled or not
bool isDarkTheme(BuildContext context) {
  final appBloc =
      Provider.of<ApplicationBloc>(context, listen: false);
  return appBloc.brightness == Brightness.dark;
}
