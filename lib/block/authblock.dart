import 'package:coincontrol/imports.dart';

class AuthBlok extends ChangeNotifier {
  int _activeIndex = 1;
  final List<Widget> _screens = [];

  switchScreen(int index) {
    _activeIndex = index;
    notifyListeners();
  }

  Widget getActiveScreen() {
    return _screens[_activeIndex];
  }
}
