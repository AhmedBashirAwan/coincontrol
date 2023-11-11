import 'package:coincontrol/imports.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(
                            uid: FirebaseAuth.instance.currentUser!.uid,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.arrow_back)),
              ],
            ),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Light'),
                    Switch(
                      value: appBloc.brightness == Brightness.dark,
                      onChanged: (value) {
                        appBloc.changeTheme();
                      },
                    ),
                    const Text('Dark'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.179,
            ),
          ],
        ),
      )),
    );
  }
}
