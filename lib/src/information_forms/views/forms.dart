import 'package:coincontrol/imports.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';

class InformationForms extends StatefulWidget {
  final String uid;
  const InformationForms({super.key, required this.uid});

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
        leading: InkWell(
            onTap: () {
              if (currentSteps == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard(
                          uid: FirebaseAuth.instance.currentUser?.uid)),
                );
              } else {
                setState(() {
                  currentSteps -= 1;
                });
              }
            },
            child: const Icon(Icons.arrow_back)),
      ),
      body: Theme(
        data: Theme.of(context)
            .copyWith(colorScheme: ColorScheme.light(primary: LIGHT_SEC_COLOR)),
        child: Stepper(
          // elevation: 0,
          stepIconBuilder: (stepIndex, stepState) {
            return Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: currentSteps == stepIndex || stepIndex < currentSteps
                      ? Colors.black
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Center(
                  child: stepIndex < currentSteps
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        )
                      : Text('${stepIndex + 1}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: stepIndex <= currentSteps
                                  ? Colors.white
                                  : Colors.black))),
            );
          },
          controlsBuilder: (context, details) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            );
          },
          steps: getStep(context),
          type: StepperType.horizontal,
          currentStep: currentSteps,
          onStepContinue: () {
            final isLastStep = currentSteps == getStep(context).length - 1;
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
      ),
    );
  }

  List<String> suggestions = [
    'Doctor',
    'Software Developer',
    'Salesman',
    'Businessman',
    'Teacher',
    'Nurse',
    'Mechanical Engineer',
    'Electrician',
    'Chef',
    'Graphic Designer',
    'Web Developer',
    'Financial Analyst',
    'Marketing Specialist',
    'Human Resources Manager',
    'Customer Support Representative',
    'Data Scientist',
    'Network Administrator',
    'Quality Assurance Tester',
    'Project Manager',
    'Systems Administrator',
    'IT Support Specialist',
    'Operations Manager',
    'Accountant',
    'Research Scientist',
    'Legal Assistant',
    'Photographer',
    'Social Media Manager',
    'Event Planner',
    'Fitness Trainer',
  ];

  List<Step> getStep(BuildContext context) => [
        Step(
          state: currentSteps == 0 ? StepState.editing : StepState.complete,
          isActive: currentSteps == 0,
          title: Visibility(
              visible: currentSteps == 0 ? true : false,
              child: const Text('Personal Information')),
          content: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color:
                  isDarkTheme(context) == true ? Colors.black : LIGHT_PRI_COLOR,
              height: getHeight(context) * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Job description',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.064,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: EasyAutocomplete(
                          controller: job,
                          suggestions: suggestions,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Family Members',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: familyMembers,
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Mothly Income',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: income,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Mothly Savings',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: savings,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          const Text(
                            'Living Condition  :',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
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
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: getwidth(context) * 0.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: isDarkTheme(context) == true
                                    ? Colors.black
                                    : Colors.white,
                                backgroundColor: isDarkTheme(context) == true
                                    ? Colors.white
                                    : Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              if (currentSteps == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                          uid: FirebaseAuth
                                              .instance.currentUser?.uid)),
                                );
                                FormsController().sendingData(
                                    bills: bills.text.trim(),
                                    rent: rent.text.trim(),
                                    debts: debt.text.trim(),
                                    otherIncomes: otherIncome.text.trim(),
                                    investmentReturns:
                                        investmentReturn.text.trim(),
                                    education: education.text.trim(),
                                    groceries: groceries.text.trim(),
                                    income: income.text.trim(),
                                    job: job.text.trim(),
                                    mems: familyMembers.text.trim(),
                                    condition: dropdownValue,
                                    others: others.text.trim(),
                                    savings: savings.text.trim(),
                                    transportation: transportation.text.trim());
                                FormsController().updatingStatus();
                              } else {
                                setState(() {
                                  currentSteps += 1;
                                });
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Step(
          state: currentSteps == 1 ? StepState.editing : StepState.complete,
          isActive: currentSteps == 1,
          title: Visibility(
              visible: currentSteps == 1 ? true : false,
              child: const Text('Mothly Expense')),
          content: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color:
                  isDarkTheme(context) == true ? Colors.black : LIGHT_PRI_COLOR,
              height: getHeight(context) * 0.76,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Rent',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.064,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: rent,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Bills',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: bills,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Transportation',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: transportation,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Groceries',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: groceries,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Education',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: education,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Others',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: others,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: getwidth(context) * 0.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: isDarkTheme(context) == true
                                    ? Colors.black
                                    : Colors.white,
                                backgroundColor: isDarkTheme(context) == true
                                    ? Colors.white
                                    : Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              if (currentSteps == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                          uid: FirebaseAuth
                                              .instance.currentUser?.uid)),
                                );
                                FormsController().sendingData(
                                    bills: bills.text.trim(),
                                    rent: rent.text.trim(),
                                    debts: debt.text.trim(),
                                    otherIncomes: otherIncome.text.trim(),
                                    investmentReturns:
                                        investmentReturn.text.trim(),
                                    education: education.text.trim(),
                                    groceries: groceries.text.trim(),
                                    income: income.text.trim(),
                                    job: job.text.trim(),
                                    mems: familyMembers.text.trim(),
                                    condition: dropdownValue,
                                    others: others.text.trim(),
                                    savings: savings.text.trim(),
                                    transportation: transportation.text.trim());
                                FormsController().updatingStatus();
                              } else {
                                setState(() {
                                  currentSteps += 1;
                                });
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Step(
          state: currentSteps == 2 ? StepState.editing : StepState.complete,
          isActive: currentSteps == 2,
          title: Visibility(
              visible: currentSteps == 2 ? true : false,
              child: const Text('Others')),
          content: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color:
                  isDarkTheme(context) == true ? Colors.black : LIGHT_PRI_COLOR,
              height: getHeight(context) * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      textAlign: TextAlign.center,
                      'Other Incomes',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.064,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: otherIncome,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Investment Returns',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: investmentReturn,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      'Debts',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: getHeight(context) * 0.06,
                      // width: getwidth(context),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: debt,
                          decoration: const InputDecoration(
                              border: InputBorder.none, prefix: Text('Rs')),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          // width: getwidth(context) * 0.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: isDarkTheme(context) == true
                                    ? Colors.black
                                    : Colors.white,
                                backgroundColor: isDarkTheme(context) == true
                                    ? Colors.white
                                    : Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              if (currentSteps == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                          uid: FirebaseAuth
                                              .instance.currentUser?.uid)),
                                );
                                FormsController().sendingData(
                                    bills: bills.text.trim(),
                                    rent: rent.text.trim(),
                                    debts: debt.text.trim(),
                                    otherIncomes: otherIncome.text.trim(),
                                    investmentReturns:
                                        investmentReturn.text.trim(),
                                    education: education.text.trim(),
                                    groceries: groceries.text.trim(),
                                    income: income.text.trim(),
                                    job: job.text.trim(),
                                    mems: familyMembers.text.trim(),
                                    condition: dropdownValue,
                                    others: others.text.trim(),
                                    savings: savings.text.trim(),
                                    transportation: transportation.text.trim());
                                FormsController().updatingStatus();
                              } else {
                                setState(() {
                                  currentSteps += 1;
                                });
                              }
                            },
                            child: const Text("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ];
}
