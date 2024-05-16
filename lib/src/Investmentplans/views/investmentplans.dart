import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/Investmentplans/controllers/investment_controllers.dart';
import 'package:coincontrol/src/Investmentplans/views/investments_details.dart';
import 'package:flutter/material.dart';

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
            ),
          ),
          elevation: 5,
          title: const Text(
            'Investment Plans',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.data == null || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available.'));
                  } else {
                    return ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final imageUrl = snapshot.data![index]['image_URL'];
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: getHeight(context) * 0.15,
                              child: Material(
                                elevation: 4,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: getHeight(context) * 0.15,
                                        width: getWidth(context) * 0.4,
                                        child: imageUrl != null
                                            ? FittedBox(
                                                child: Image.network(imageUrl),
                                              )
                                            : const Center(
                                                child: Text('No Image')),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 5),
                                          Text(
                                            snapshot.data![index]['title'] ??
                                                '',
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(
                                            width: getWidth(context) * 0.4,
                                            child: Text(
                                              snapshot.data![index]
                                                      ['description'] ??
                                                  '',
                                              // overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
