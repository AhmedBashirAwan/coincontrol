import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincontrol/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../../constants.dart';
import '../../../theme/colors.dart';
import '../../auth/components/buttons.dart';
import '../../dashboard/views/dashboard.dart';

class InformationForms extends StatefulWidget {
  String uid;
  InformationForms({super.key, required this.uid});

  @override
  State<InformationForms> createState() => InformationStateForms();
}

class InformationStateForms extends State<InformationForms> {
  int currentSteps = 0;
  bool isCompleted = false;

  final account = TextEditingController();
  final province = TextEditingController();
  final city = TextEditingController();
  final street = TextEditingController();
  final password = TextEditingController();
  final country = TextEditingController();

  Future<void> updatingStatus() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('userCredentials')
        .where('user_ID', isEqualTo: widget.uid)
        .get();

    if (data.docs.isNotEmpty) {
      var documentId = data.docs.first.id;
      await FirebaseFirestore.instance
          .collection('userCredentials')
          .doc(documentId)
          .update({'new_User': false});
    } else {
      // Handle the case where no document is found for the given user ID.
      print("No document found for user ID: ${widget.uid}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: LIGHT_SEC_COLOR)),
        child: Padding(
          padding: const EdgeInsets.only(right: 20, top: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Dashboard(
                                uid: FirebaseAuth.instance.currentUser!.uid,
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.close))
                  ],
                ),
                Stepper(
                  // type: StepperType.horizontal,
                  steps: getStep(),
                  currentStep: currentSteps,

                  onStepContinue: () {
                    final isLastStep = currentSteps == getStep().length - 1;
                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      updatingStatus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(
                            uid: widget.uid,
                          ),
                        ),
                      );
                      print('Completed');
                    } else {
                      setState(() => currentSteps += 1);
                    }
                  },

                  onStepTapped: (step) => setState(() {
                    currentSteps = step;
                  }),
                  onStepCancel: currentSteps == 0
                      ? null
                      : () => setState(() => currentSteps -= 1),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getStep() => [
        Step(
            state: currentSteps > 0 ? StepState.complete : StepState.indexed,
            isActive: currentSteps >= 0,
            title: const Text('Job Details'),
            content: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: account,
                  decoration: InputDecoration(
                    labelText: 'Job Description',
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Total Income',
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'Expenses',
                    filled: true,
                    fillColor: Colors.grey[300],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            )),
        Step(
            state: currentSteps > 1 ? StepState.complete : StepState.indexed,
            isActive: currentSteps >= 1,
            title: const Text('Investments'),
            content: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  TextFormField(
                    controller: country,
                    decoration: InputDecoration(
                      labelText: 'Total Invested',
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: province,
                    decoration: InputDecoration(
                      labelText: 'Total Returns',
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: city,
                    decoration: InputDecoration(
                      labelText: 'Savings ',
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: street,
                    decoration: InputDecoration(
                      labelText: 'Financial Goals',
                      filled: true,
                      fillColor: Colors.grey[300],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Step(
            state: currentSteps > 3 ? StepState.complete : StepState.indexed,
            isActive: currentSteps >= 2,
            title: const Text('Complete'),
            content: Column(
              children: const [
                Text('If you have completed your form then Click Continue')
              ],
            )),
      ];
}
