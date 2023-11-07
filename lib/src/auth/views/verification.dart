import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../constants.dart';
import '../../../imports.dart';
import '../../../theme/colors.dart';
import '../components/buttons.dart';
import '../components/textfields.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: getHeight(context) * 0.25,
            ),
            Row(
              children: const [
                Text('Enter OTP Code',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5648),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: RichText(
                        text: const TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Enter the 4 digit Code we send You',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                              fontSize: 15)),
                    ])),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(context) * 0.01,
            ),
            // Fields(
            //   background: LIGHT_COLOR,
            //   controller: _email,
            //   radius: 18,
            //   hint: 'Email',
            // ),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 50,
              style: const TextStyle(fontSize: 17),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                print("Completed: " + pin);
              },
            ),
            SizedBox(
              height: getWidth(context) * 0.05,
            ),
            SizedBox(
                width: getWidth(context),
                child: CustomElevatedBtn(
                  height: getHeight(context) * 0.06,
                  radius: 18,
                  foregroundColor: LIGHT_COLOR,
                  backgroundColor: LIGHT_SEC_COLOR,
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {},
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                    child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: appBloc.brightness == Brightness.light
                                    ? Colors.black
                                    : Colors.white),
                            children: const <TextSpan>[
                          TextSpan(
                              text: 'Return to ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                          TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                  color: Color(0xFFAA553C),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
