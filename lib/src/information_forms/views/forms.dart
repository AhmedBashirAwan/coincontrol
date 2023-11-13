import 'package:coincontrol/imports.dart';

class InformationForms extends StatefulWidget {
  String uid;
  InformationForms({super.key, required this.uid});

  @override
  State<InformationForms> createState() => InformationStateForms();
}

class InformationStateForms extends State<InformationForms> {
  int currentSteps = 0;
  bool isCompleted = false;

  final job = TextEditingController();
  final income = TextEditingController();
  final expenses = TextEditingController();
  final investments = TextEditingController();
  final returns = TextEditingController();
  final savings = TextEditingController();
  final familyMembers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor:
            isDarkTheme(context) == true ? Colors.white : Colors.black,
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_PRI_COLOR,
        toolbarHeight: 30,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
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
                child: const Icon(Icons.close)),
          )
        ],
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: LIGHT_SEC_COLOR)),
        child: Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stepper(
                  steps: getStep(),
                  currentStep: currentSteps,
                  onStepContinue: () {
                    final isLastStep = currentSteps == getStep().length - 1;
                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      FormsController().updatingStatus();
                      FormsController().sendingForms(
                          expense: expenses.text.trim(),
                          income: income.text.trim(),
                          job: job.text.trim(),
                          mems: familyMembers.text.trim(),
                          investment: investments.text.trim(),
                          returns: returns.text.trim(),
                          savings: savings.text.trim());
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
                  controller: job,
                  decoration: InputDecoration(
                    labelText: 'Job Description',
                    filled: true,
                    labelStyle: TextStyle(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black),
                    fillColor: isDarkTheme(context) == true
                        ? Colors.black54
                        : Colors.grey[300],
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
                  controller: income,
                  decoration: InputDecoration(
                    labelText: 'Total Income',
                    filled: true,
                    labelStyle: TextStyle(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black),
                    fillColor: isDarkTheme(context) == true
                        ? Colors.black54
                        : Colors.grey[300],
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
                  controller: expenses,
                  decoration: InputDecoration(
                    labelText: 'Expenses',
                    filled: true,
                    labelStyle: TextStyle(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black),
                    fillColor: isDarkTheme(context) == true
                        ? Colors.black54
                        : Colors.grey[300],
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
                    controller: investments,
                    decoration: InputDecoration(
                      labelText: 'Total Invested',
                      filled: true,
                      labelStyle: TextStyle(
                          color: isDarkTheme(context) == true
                              ? Colors.white
                              : Colors.black),
                      fillColor: isDarkTheme(context) == true
                          ? Colors.black54
                          : Colors.grey[300],
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
                    controller: returns,
                    decoration: InputDecoration(
                      labelText: 'Total Returns',
                      filled: true,
                      labelStyle: TextStyle(
                          color: isDarkTheme(context) == true
                              ? Colors.white
                              : Colors.black),
                      fillColor: isDarkTheme(context) == true
                          ? Colors.black54
                          : Colors.grey[300],
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
                    controller: savings,
                    decoration: InputDecoration(
                      labelText: 'Savings ',
                      filled: true,
                      labelStyle: TextStyle(
                          color: isDarkTheme(context) == true
                              ? Colors.white
                              : Colors.black),
                      fillColor: isDarkTheme(context) == true
                          ? Colors.black54
                          : Colors.grey[300],
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
                    controller: familyMembers,
                    decoration: InputDecoration(
                      labelText: 'Family Members',
                      filled: true,
                      labelStyle: TextStyle(
                          color: isDarkTheme(context) == true
                              ? Colors.white
                              : Colors.black),
                      fillColor: isDarkTheme(context) == true
                          ? Colors.black54
                          : Colors.grey[300],
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
