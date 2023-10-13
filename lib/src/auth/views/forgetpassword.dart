import 'package:coincontrol/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants.dart';
import '../components/buttons.dart';
import '../components/textfields.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: getHeight(context) * 0.03,
            ),
            Text('Reset Password', style: heading(25)),
            SizedBox(
              height: getHeight(context) * 0.08,
            ),
            Fields(
              background: Colors.black38,
              controller: _email,
              radius: 10,
              hint: 'Email',
            ),
            SizedBox(
              height: getHeight(context) * 0.05,
            ),
            SizedBox(
                width: getWidth(context),
                child: CustomElevatedBtn(
                  height: getHeight(context) * 0.06,
                  radius: 10,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink,
                  child: const Text(
                    'Send Email',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: _email.text);
                  },
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: appBloc.brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                            children: const <TextSpan>[
                          TextSpan(
                              text: 'Return to Login ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 11)),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11)),
                        ])),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: appBloc.brightness == Brightness.dark,
                  onChanged: (value) {
                    appBloc.changeTheme();
                  },
                ),
              ],
            ),
          ],
        ),
      ))),
    );
  }
}
