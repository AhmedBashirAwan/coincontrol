import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/Investmentplans/views/investmentplans.dart';
import 'package:coincontrol/src/dashboard/controllers/dashboardController.dart';
import 'package:coincontrol/src/debtrecovery/views/debtrecovery.dart';

import '../../budgetcreation/views/goalsettings.dart';

class Dashboard extends StatefulWidget {
  String? uid;
  Dashboard({super.key, required this.uid});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //user data is stored in credentials
  Map<String, dynamic> credentials = {};

  @override
  void initState() {
    super.initState();
    initializeCredentials();
  }

  void initializeCredentials() async {
    credentials = await DashboardController().fetchingUsersCredentials();
    // TODO: Add any additional logic or state updates based on the fetched credentials
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor:
                isDarkTheme(context) == true ? Colors.black : LIGHT_PRI_COLOR,
            foregroundColor:
                isDarkTheme(context) == true ? Colors.white : Colors.black,
            toolbarHeight: 40,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      decoration: BoxDecoration(
                          color: isDarkTheme(context) == true
                              ? Colors.white
                              : Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(
                          Icons.question_mark,
                          color: isDarkTheme(context) == true
                              ? Colors.black
                              : Colors.white,
                        ),
                      )),
                ),
              )
            ]),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                future: DashboardController().fetchingUsersCredentials(),
                builder: (context, snapshot) {
                  return Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InformationForms(
                            uid: USER_ID,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: isDarkTheme(context) == true
                              ? Colors.black54
                              : LIGHT_CARDS),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              CircleAvatar(
                                radius: 35,
                                child: Text(
                                  credentials['name']?[0] ?? 'N/A',
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                credentials['name'] ?? 'N/A',
                                style: const TextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w500),
                              ),
                              Flexible(
                                child: Text(
                                  credentials['email'] ?? 'N/A',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ));
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isDarkTheme(context) == true
                        ? Colors.black54
                        : LIGHT_CARDS),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const GoalSetting(),
                            ),
                          );
                        },
                        child: Container(
                          height: getHeight(context) * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isDarkTheme(context) == true
                                  ? Colors.grey.shade800
                                  : LIGHT_SEC_COLOR),
                          child: const Center(
                              child: Text(
                            "AI Budget Creation",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          )),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DebtRecovery(),
                            ),
                          );
                        },
                        child: Container(
                          height: getHeight(context) * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isDarkTheme(context) == true
                                  ? Colors.grey.shade800
                                  : LIGHT_SEC_COLOR),
                          child: const Center(
                              child: Text(
                            "AI Debt Recovery",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InvestmentPlans(),
                        ),
                      );
                    },
                    child: Container(
                      height: getHeight(context) * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                          // color: LIGHT_CARDS
                          ),
                      child: Image.asset("lib/assets/Investment.png"),
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReliefPlans(),
                        ),
                      );
                    },
                    child: Container(
                      height: getHeight(context) * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                          // color: LIGHT_CARDS
                          ),
                      child: FittedBox(
                          child: Image.asset("lib/assets/reliefplans.png")),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: getHeight(context) * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children:  [
                    const Text(
                      "Investmnet Plans",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: getWidth(context)*0.2,
                    ),
                   const Text(
                      "Relief Plans",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
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
