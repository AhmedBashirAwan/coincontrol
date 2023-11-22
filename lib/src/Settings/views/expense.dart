import 'package:coincontrol/imports.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() => _ExpenseState();
}

class _ExpenseState extends State<Expense> {
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
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    "Rents",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
                    "Bills",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
                    "Travel Cost",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
                    "Groceries",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
                    "Education",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
                    "Installments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
                    "Others ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              TextFormField(
                // controller: nameController,
                // readOnly: monthlySavingd,
                decoration: InputDecoration(
                  // hintText: credentials['name'],
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        // monthlySavingd = false;
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
