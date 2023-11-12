import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/relief_plans/controllers/maps.dart';

class ReliefPlans extends StatefulWidget {
  const ReliefPlans({super.key});

  @override
  State<ReliefPlans> createState() => _ReliefPlansState();
}

class _ReliefPlansState extends State<ReliefPlans> {
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
          child: Column(
            children: [
              Expanded(child: FutureBuilder(
                builder: (context, snapshot) {
                  return ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: plans.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 20, right: 20, left: 20),
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
                                        'https://media.istockphoto.com/id/535695503/photo/pakistan-monument-islamabad.jpg?s=1024x1024&w=is&k=20&c=akCX--lZcyHV2SSebGbu2wvnSJsscQB95K7HxyE0Fhs='),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Title',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    'Description',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ]),
                          ),
                        ),
                      );
                    },
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
