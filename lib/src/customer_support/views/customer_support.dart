import 'package:coincontrol/constants.dart';
import 'package:coincontrol/src/customer_support/views/faqsdetails.dart';
import 'package:coincontrol/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: LIGHT_PRI_COLOR,
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
          'FAQ\'s',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Material(
              elevation: 40,
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqDetails(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('How debt recovery works?'),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_rounded,
                            // color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqDetails(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('How Budget Creation works?'),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_rounded,
                            // color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqDetails(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('How to get Investment Ideas?'),
                          Spacer(),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            // color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqDetails(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('How to use Relief plans?'),
                          Spacer(),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            // color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Divider(
                      color: Colors.black12,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FaqDetails(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('Use of In-app settings?'),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_rounded,
                            // color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
