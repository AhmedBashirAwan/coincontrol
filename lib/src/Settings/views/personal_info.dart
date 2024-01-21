import 'package:coincontrol/imports.dart';

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
          child: Column(
            children: [
              const Row(
                children:  [
                  Text(
                    "Job Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                readOnly: jobDes,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
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
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        TextFormField(
                          // controller: nameController,
                          readOnly: monthlyIncome,
                          decoration: InputDecoration(
                            // hintText: credentials['name'],
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
                        Row(
                          children: const [
                            Text(
                              "Monthly Savings",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        TextFormField(
                          // controller: nameController,
                          readOnly: monthlySavingd,
                          decoration: InputDecoration(
                            // hintText: credentials['name'],
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

              Row(
                children: const [
                  Text(
                    "Other incomes",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
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
                children: const [
                  Text(
                    "Investment Return",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
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
                children: const [
                  Text(
                    "Debts Return",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                  onPressed: () async {},
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
