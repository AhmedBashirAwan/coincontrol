import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/information_forms/components/formsfields.dart';

class InformationForms extends StatefulWidget {
  String uid;
  InformationForms({super.key, required this.uid});

  @override
  State<InformationForms> createState() => InformationStateForms();
}

class InformationStateForms extends State<InformationForms> {
  int currentSteps = 0;
  bool isCompleted = false;
  String dropdownValue = 'Average';

  final job = TextEditingController();
  final income = TextEditingController();
  final expenses = TextEditingController();
  final investments = TextEditingController();
  final returns = TextEditingController();
  final savings = TextEditingController();
  final familyMembers = TextEditingController();
  final rent = TextEditingController();
  final bills = TextEditingController();
  final transportation = TextEditingController();
  final groceries = TextEditingController();
  final education = TextEditingController();
  final others = TextEditingController();
  final otherIncome = TextEditingController();
  final investmentReturn = TextEditingController();
  final debt = TextEditingController();

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
                      FormsController().sendingData(
                          job: job.text.trim(),
                          mems: familyMembers.text.trim(),
                          income: income.text.trim(),
                          savings: savings.text.trim(),
                          condition: dropdownValue.toString(),
                          rent: rent.text.trim(),
                          bills: bills.text.trim(),
                          transportation: transportation.text.trim(),
                          groceries: groceries.text.trim(),
                          education: education.text.trim(),
                          others: others.text.trim(),
                          otherIncomes: otherIncome.text.trim(),
                          investmentReturns: investmentReturn.text.trim(),
                          debts: debt.text.trim());
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
            title: const Text('Personal Information'),
            content: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: job,
                  label: "Job Description",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: familyMembers,
                  label: "Family Members",
                  inputType: TextInputType.number,
                ),
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: income,
                  label: "Mothly Income",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: savings,
                  label: "Mothly Savings",
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Text(
                        'Living Condition  :',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      const Spacer(),
                      DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>['Luxury', 'Good', 'Average', 'Low']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                
                ),
              ],
            )),
        Step(
            state: currentSteps > 1 ? StepState.complete : StepState.indexed,
            isActive: currentSteps >= 1,
            title: const Text('Mothly Expense'),
            content: Container(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  FormsFields(
                    controller: rent,
                    label: "Rent",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormsFields(
                    controller: bills,
                    label: "Bills",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormsFields(
                    controller: transportation,
                    label: "Traportation Cost",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormsFields(
                    controller: groceries,
                    label: "Groceries",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormsFields(
                    controller: education,
                    label: "Education",
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // FormsFields(
                  //   controller: familyMembers,
                  //   label: "Medication",
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // FormsFields(
                  //   controller: familyMembers,
                  //   label: "Instalments",
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormsFields(
                    controller: others,
                    label: "Others",
                  ),
                ],
              ),
            )),
        Step(
            state: currentSteps > 3 ? StepState.complete : StepState.indexed,
            isActive: currentSteps >= 2,
            title: const Text('Others'),
            content: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: otherIncome,
                  label: "Other Income",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: investmentReturn,
                  label: "Investment Returns",
                ),
                const SizedBox(
                  height: 10,
                ),
                FormsFields(
                  controller: debt,
                  label: "Debts",
                ),
              ],
            )),
      ];
}
