import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/Settings/controllers/settings_controller.dart';

class EditPersonal extends StatefulWidget {
  const EditPersonal({super.key});

  @override
  State<EditPersonal> createState() => _EditPersonalState();
}

class _EditPersonalState extends State<EditPersonal> {
  String dropdownValue = 'Average';
  bool jobDes = true;
  bool monthlyIncome = true;
  bool monthlySavingd = true;
  final TextEditingController _job = TextEditingController();
  final TextEditingController _income = TextEditingController();
  final TextEditingController _savings = TextEditingController();
  final TextEditingController _others = TextEditingController();
  final TextEditingController _returns = TextEditingController();
  final TextEditingController _debts = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        // toolbarHeight: getHeight(context) * 0.03,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Edit Personal Info',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder(
            future: SettingsController().fetchingPersonalInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                Map<String, dynamic>? data = snapshot.data;
                return Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Job Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _job,
                      readOnly: jobDes,
                      decoration: InputDecoration(
                        hintText: data!['job'],
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              jobDes = false;
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
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
                    // Row(
                    //   children: const [
                    //     Text(
                    //       "Family Members",
                    //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    //     ),
                    //   ],
                    // ),
                    // TextFormField(
                    //   // controller: nameController,
                    //   // readOnly: nameReadyOnly,
                    //   decoration: InputDecoration(
                    //     // hintText: credentials['name'],
                    //     suffixIcon: InkWell(
                    //       onTap: () {
                    //         setState(() {
                    //           // nameReadyOnly = false;
                    //         });
                    //       },
                    //       child: const Icon(
                    //         Icons.edit,
                    //         size: 20,
                    //       ),
                    //     ),
                    //     filled: true,
                    //     labelStyle: TextStyle(
                    //         color: isDarkTheme(context) == true
                    //             ? Colors.white
                    //             : Colors.black),
                    //     fillColor: isDarkTheme(context) == true
                    //         ? Colors.black54
                    //         : Colors.grey[300],
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //       borderSide: BorderSide.none,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Monthly Income",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _income,
                                readOnly: monthlyIncome,
                                decoration: InputDecoration(
                                  hintText: data['income'],
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        monthlyIncome = false;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                    ),
                                  ),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Row(
                                children: [
                                  Text(
                                    "Monthly Savings",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller: _savings,
                                readOnly: monthlySavingd,
                                decoration: InputDecoration(
                                  hintText: data['savings'],
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        monthlySavingd = false;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 20,
                                    ),
                                  ),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "Other incomes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _others,
                      readOnly: monthlySavingd,
                      decoration: InputDecoration(
                        hintText: data['other_Income'],
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              monthlySavingd = false;
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
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
                    const Row(
                      children: [
                        Text(
                          "Investment Return",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _returns,
                      readOnly: monthlySavingd,
                      decoration: InputDecoration(
                        hintText: data['investment_Returns'],
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              monthlySavingd = false;
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
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
                    const Row(
                      children: [
                        Text(
                          "Debts Return",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    TextFormField(
                      controller: _debts,
                      readOnly: monthlySavingd,
                      decoration: InputDecoration(
                        hintText: data['debts'],
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              monthlySavingd = false;
                            });
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
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
                    Row(
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
                    SizedBox(
                      height: getHeight(context) * 0.04,
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.4,
                      child: CustomElevatedBtn(
                        elevation: 0,
                        height: getHeight(context) * 0.06,
                        radius: 18,
                        foregroundColor: LIGHT_COLOR,
                        backgroundColor: LIGHT_SEC_COLOR,
                        child: const Text(
                          'Update',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
                          Map<String, dynamic> payload = {
                            'user_ID': FirebaseAuth.instance.currentUser!.uid,
                            'job': _job.text.isEmpty
                                ? data['job']
                                : _job.text.trim(),
                            'income': _income.text.isEmpty
                                ? data['income']
                                : _income.text.trim(),
                            'savings': _savings.text.isEmpty
                                ? data['savings']
                                : _savings.text.trim(),
                            'condition': dropdownValue.toString(),
                            'debts': _debts.text.isEmpty
                                ? data['debts']
                                : _debts.text.trim(),
                            'other_Income': _others.text.isEmpty
                                ? data['other_Income']
                                : _others.text.trim(),
                            'investment_Returns': _returns.text.isEmpty
                                ? data['investment_Returns']
                                : _returns.text.trim(),
                          };
                          SettingsController().editingPersonalInfo(payload);
                        },
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      )),
    );
  }
}
