import 'package:coincontrol/imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class PlansDetails extends StatefulWidget {
  int index;
  Map<String, dynamic> plan = {
    'user_ID': FirebaseAuth.instance.currentUser!.uid,
  };
  PlansDetails({super.key, required this.plan, required this.index});

  @override
  State<PlansDetails> createState() => _PlansDetailsState();
}

class _PlansDetailsState extends State<PlansDetails> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    // if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: const Text("Alert"),
                  content: const Text("Have You Applied In this Program?"),
                  actions: [
                    CupertinoDialogAction(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReliefPlans(),
                            ),
                          );
                        },
                        isDefaultAction: true,
                        child: const Text(
                          "No",
                          style: TextStyle(color: Colors.black),
                        )),
                    CupertinoDialogAction(
                        onPressed: () {
                          // Navigator.pop(context);
                          Map<String, dynamic> pla = {
                            'user_ID': FirebaseAuth.instance.currentUser!.uid,
                            'imageURL': widget.plan['imageURL'],
                            'title': widget.plan['title'],
                            'link': widget.plan['applied'],
                            'applied': true,
                            'description': widget.plan['description']
                          };
                          ReliefPlansControllers().applyReliefs(pla);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReliefPlans(),
                            ),
                          );
                        },
                        isDefaultAction: true,
                        child: Text(
                          "Yess",
                          style: TextStyle(color: Colors.blue.shade900),
                        )),
                  ],
                ),
              );
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 5,
        // toolbarHeight: getHeight(context) * 0.03,
        title: Text(
          widget.plan['title'],
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // color: Colors.amber,
                height: getHeight(context) * 0.3,
                child: Image.network(widget.plan['imageURL']),
              ),
              SizedBox(
                child: Text(
                  widget.plan['title'],
                  style:
                      const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                textAlign: TextAlign.justify,
                softWrap: true,
                text: TextSpan(
                    text: widget.plan['description'],
                    style: TextStyle(
                        fontSize: 16,
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black)),
              ),
              // Text(
              //   widget.plan['link'],
              //   style: const TextStyle(
              //       fontSize: 16, fontWeight: FontWeight.w300),
              // ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getWidth(context) * 0.5,
                    child: CustomElevatedBtn(
                      height: getHeight(context) * 0.03,
                      radius: 18,
                      foregroundColor: LIGHT_COLOR,
                      backgroundColor: LIGHT_SEC_COLOR,
                      child: const Text(
                        'Apply Now',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () async {
                        _launchURL(widget.plan['link']);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
