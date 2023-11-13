import 'package:coincontrol/imports.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  bool silent = false;
  int _radioValue = 1;

  @override
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        // toolbarHeight: getHeight(context) * 0.03,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Account',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Edit profile',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 23,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Personal Information',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 23,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        const Text(
                          'Expenses',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 23,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Switch(
                  value: silent,
                  onChanged: (value) {
                    setState(() {
                      if (silent == false) {
                        silent = true;
                      } else {
                        silent = false;
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Language',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Radio(
                  activeColor: isDarkTheme(context) == true
                      ? Colors.purple
                      : Colors.black,
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = 1;
                    });
                  },
                ),
                const Text(
                  "English",
                ),
                Radio(
                  activeColor: isDarkTheme(context) == true
                      ? Colors.purple
                      : Colors.black,
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) {
                    setState(() {
                      _radioValue = 2;
                    });
                  },
                ),
                const Text(
                  "Urdu",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Switch(
                  value: appBloc.brightness == Brightness.dark,
                  onChanged: (value) {
                    appBloc.changeTheme();
                  },
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
