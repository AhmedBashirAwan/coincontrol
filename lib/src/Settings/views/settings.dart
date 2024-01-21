import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/Settings/controllers/settings_controller.dart';
import 'package:coincontrol/src/Settings/views/expense.dart';
import 'package:coincontrol/src/Settings/views/personal_info.dart';
import 'package:coincontrol/src/Settings/views/profile_info.dart';

class MainSettings extends StatefulWidget {
  const MainSettings({super.key});

  @override
  State<MainSettings> createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  bool silent = false;
  int _radioValue = 1;

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
        child: FutureBuilder(
            future: SettingsController().fetchingUsersCredentials(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                bool neya = snapshot.data!['new_User'];
                return Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          const Row(
                            children: [
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                const Text(
                                  'Edit profile',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PersonalInfo(),
                                        ),
                                      );
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 23,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                const Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      if (neya == true) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                InformationForms(
                                              uid: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            ),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const EditPersonal(),
                                          ),
                                        );
                                      }
                                    },
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 23,
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Row(
                              children: [
                                const Text(
                                  'Expenses',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                const Spacer(),
                                InkWell(
                                    onTap: () {
                                      if (neya == true) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                InformationForms(
                                              uid: FirebaseAuth
                                                  .instance.currentUser!.uid,
                                            ),
                                          ),
                                        );
                                      } else {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const Expense(),
                                          ),
                                        );
                                      }
                                    },
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
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Switch(

                          activeTrackColor: Colors.black,
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
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
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
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
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
                );
              }
            }),
      )),
    );
  }
}
