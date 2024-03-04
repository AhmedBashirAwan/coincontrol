import 'package:coincontrol/imports.dart';
import 'package:coincontrol/src/Settings/controllers/settings_controller.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
  final TextEditingController _rent = TextEditingController();
  final TextEditingController _bills = TextEditingController();
  final TextEditingController _transport = TextEditingController();
  final TextEditingController _grocieries = TextEditingController();
  final TextEditingController _education = TextEditingController();
  final TextEditingController _others = TextEditingController();
  bool billRead = true;
  bool transportRead = true;
  bool rentRead = true;
  bool groceRead = true;
  bool educationRead = true;
  bool othersRead = true;
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
          'Expenses',
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
              future: SettingsController().fetchingFinancialInfo(),
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
                            "Rents",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _rent,
                        readOnly: rentRead,
                        decoration: InputDecoration(
                          hintText: data!['rent'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                rentRead = false;
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
                            "Bills",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _bills,
                        readOnly: billRead,
                        decoration: InputDecoration(
                          hintText: data['bills'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                billRead = false;
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
                            "Travel Cost",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _transport,
                        readOnly: transportRead,
                        decoration: InputDecoration(
                          hintText: data['transportation'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                transportRead = false;
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
                            "Groceries",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _grocieries,
                        readOnly: groceRead,
                        decoration: InputDecoration(
                          hintText: data['groceries'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                groceRead = false;
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
                            "Education",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _education,
                        readOnly: educationRead,
                        decoration: InputDecoration(
                          hintText: data['education'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                educationRead = false;
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
                      // const Row(
                      //   children: [
                      //     Text(
                      //       "Installments",
                      //       style: TextStyle(
                      //           fontSize: 18, fontWeight: FontWeight.w500),
                      //     ),
                      //   ],
                      // ),
                      // TextFormField(
                      //   // controller: nameController,
                      //   // readOnly: monthlySavingd,
                      //   decoration: InputDecoration(
                      //     // hintText: credentials['name'],
                      //     suffixIcon: InkWell(
                      //       onTap: () {
                      //         setState(() {
                      //           // monthlySavingd = false;
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
                      const Row(
                        children: [
                          Text(
                            "Others ",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _others,
                        readOnly: othersRead,
                        decoration: InputDecoration(
                          hintText: data['others'],
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                othersRead = false;
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
                              'rent': _rent.text.isEmpty
                                  ? data['rent']
                                  : _rent.text.trim(),
                              'transportation': _transport.text.isEmpty
                                  ? data['transportation']
                                  : _transport.text.trim(),
                              'bills': _bills.text.isEmpty
                                  ? data['bills']
                                  : _bills.text.trim(),
                              'groceries': _grocieries.text.isEmpty
                                  ? data['groceries']
                                  : _grocieries.text.trim(),
                              'education': _education.text.isEmpty
                                  ? data['education']
                                  : _education.text.trim(),
                              'others': _others.text.isEmpty
                                  ? data['others']
                                  : _others.text.trim(),
                            };
                            SettingsController().editingFinancialInfo(payload);
                          },
                        ),
                      )
                    ],
                  );
                }
              }),
        ),
      )),
    );
  }
}
