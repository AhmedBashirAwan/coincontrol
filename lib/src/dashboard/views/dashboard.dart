import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincontrol/constants.dart';
import 'package:coincontrol/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../theme/colors.dart';
import '../../Settings/views/settings.dart';

class Dashboard extends StatefulWidget {
  String? uid;
  Dashboard({super.key, required this.uid});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic> credentials = {};
  Future<Map<String, dynamic>> fetchingUsersCredentials() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
        .instance
        .collection('userCredentials')
        .where("user_ID", isEqualTo: widget.uid)
        .get();
    print(userData.docs.first.data());
    setState(() {
      credentials = userData.docs.first.data();
    });
    return userData.docs.first.data();
  }

  @override
  void initState() {
    fetchingUsersCredentials();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 60,
            backgroundColor: LIGHT_PRI_COLOR,
            foregroundColor: Colors.white,
            toolbarHeight: 30,
           
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.question_mark,
                          color: Colors.white,
                        ),
                      )),
                ),
              )
            ]),
        drawer: Drawer(
          child: Container(
            padding: const EdgeInsets.all(20),
            color: LIGHT_PRI_COLOR,
            child: Column(
              children: [
                const Spacer(),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                  ),
                  title: const Text('Settings'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainSettings(),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout_rounded,
                  ),
                  title: const Text('Logout'),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  // flex: zzz,
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: LIGHT_CARDS),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const CircleAvatar(
                          radius: 35,
                          //   child: Text(
                          //   credentials['name'] ?? 'N/A',
                          //   style: const TextStyle(
                          //       fontSize: 28, fontWeight: FontWeight.w500),
                          // ),
                        ),
                        Text(
                          credentials['name'] ?? 'N/A',
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    //  color: Colors.amber
                    color: LIGHT_CARDS),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.amber
                            color: LIGHT_SEC_COLOR),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.amber
                            color: LIGHT_SEC_COLOR),
                      ),
                    ],
                  ),
                ),
              )),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: getHeight(context) * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                          // color: LIGHT_CARDS
                          ),
                      child: Image.asset("lib/assets/Investment.png"),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: Container(
                      height: getHeight(context) * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                          // color: LIGHT_CARDS
                          ),
                      child: FittedBox(
                          child: Image.asset("lib/assets/reliefplans.png")),
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ));
  }
}
