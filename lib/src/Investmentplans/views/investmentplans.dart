import 'package:coincontrol/imports.dart';

import '../controllers/investment_controllers.dart';
import 'investments_details.dart';

class InvestmentPlans extends StatefulWidget {
  const InvestmentPlans({super.key});

  @override
  State<InvestmentPlans> createState() => _InvestmentPlansState();
}

class _InvestmentPlansState extends State<InvestmentPlans> {
  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 5,
          // toolbarHeight: getHeight(context) * 0.03,
          title: const Text(
            'Investmnet Plans',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor:
              isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: FutureBuilder(
                future: InvestmentContoller().fetchingPlans(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InvestmentDetails(
                                    index: index,
                                    plan: snapshot.data![index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              height: getHeight(context) * 0.15,
                              child: Material(
                                elevation: 4,
                                child: Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: getHeight(context) * 0.15,
                                      width: getWidth(context) * 0.4,
                                      child: FittedBox(
                                        child: Image.network(
                                          snapshot.data![index]['image_URL'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        snapshot.data![index]['title'],
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![index]['description'],
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
