import 'package:coincontrol/constants.dart';
import 'package:coincontrol/imports.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../theme/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
            color: LIGHT_PRI_COLOR,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  // margin: EdgeInsets.all(0),
                  // padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.transparent),
                    color: LIGHT_CARDS,
                  ),
                  child: const Text('Drawer Header'),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                  ),
                  title: const Text('Page 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.train,
                  ),
                  title: const Text('Page 2'),
                  onTap: () {
                    Navigator.pop(context);
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
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 35,
                        ),
                        Text(
                          'Username',
                          style: TextStyle(
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
