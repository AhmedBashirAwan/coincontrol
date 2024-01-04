import 'package:flutter/material.dart';

import '../../../imports.dart';

class CustomPopUP extends StatefulWidget {
  CustomPopUP({
    super.key,
  });

  @override
  State<CustomPopUP> createState() => _CustomPopUPState();
}

class _CustomPopUPState extends State<CustomPopUP> {
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Goal Settings"),
          const Spacer(),
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: getHeight(context) * 0.3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Increase Savings ",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Radio(
                    activeColor: isDarkTheme(context) == true
                        ? Colors.purple
                        : Colors.black,
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Luxury Lifestyle",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Radio(
                    activeColor: isDarkTheme(context) == true
                        ? Colors.purple
                        : Colors.black,
                    value: 2,
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const Text(
                    "Good Lifestyle",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Radio(
                    activeColor: isDarkTheme(context) == true
                        ? Colors.purple
                        : Colors.black,
                    value: 3,
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = 3;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
