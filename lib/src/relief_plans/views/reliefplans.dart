import 'package:coincontrol/imports.dart';

class ReliefPlans extends StatefulWidget {
  const ReliefPlans({super.key});

  @override
  State<ReliefPlans> createState() => _ReliefPlansState();
}

class _ReliefPlansState extends State<ReliefPlans> {
  @override
  void initState() {
    ReliefPlansControllers().fetchingAllReliefPlans();
    ReliefPlansControllers().fetchingAppliedReliefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Dashboard(uid: FirebaseAuth.instance.currentUser?.uid),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          elevation: 5,
          toolbarHeight: getHeight(context) * 0.03,
          title: const Text(
            'Relief Plans',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          backgroundColor:
              isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
          bottom: const TabBar(
            tabs: [
              Tab(
                // icon: Icon(Icons.video_call),
                text: "Avaliable",
              ),
              Tab(
                // icon: Icon(Icons.settings),
                text: "Applied",
              )
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              Column(
                children: [
                  Expanded(
                      child: FutureBuilder(
                          future:
                              ReliefPlansControllers().fetchingAllReliefPlans(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                                            builder: (context) => PlansDetails(
                                              index: index,
                                              plan: snapshot.data![index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        height: getHeight(context) * 0.15,
                                        child: Material(
                                          elevation: 4,
                                          child: Row(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                height:
                                                    getHeight(context) * 0.15,
                                                width: getWidth(context) * 0.4,
                                                child: FittedBox(
                                                  child: Image.network(
                                                    snapshot.data![index]
                                                        ['imageURL'],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                SizedBox(
                                                  width:
                                                      getWidth(context) * 0.4,
                                                  child: Text(
                                                    snapshot.data![index]
                                                        ["title"],
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      getWidth(context) * 0.4,
                                                  child: Text(
                                                    snapshot.data![index]
                                                        ['description'],
                                                    style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
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
                          }))
                ],
              ),
              Column(
                children: [
                  Expanded(
                      child: FutureBuilder(
                    future: ReliefPlansControllers().fetchingAppliedReliefs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        List<Map<String, dynamic>>? data = snapshot.data;
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
                                      builder: (context) => PlansDetails(
                                        index: index,
                                        plan: data[index],
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
                                                data![index]['imageURL']),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: getWidth(context) * 0.4,
                                            child: Text(
                                              data[index]["title"],
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: getWidth(context) * 0.4,
                                            child: Text(
                                              data[index]['description'],
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
