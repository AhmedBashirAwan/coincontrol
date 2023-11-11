import 'package:coincontrol/imports.dart';

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

    // validating email
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isNotEmpty && !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }

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
                Text('Forget Password',
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
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text:
                              'Enter the Email you used to create the account, so we can send you the instructions to reset your password',
                          style: TextStyle(
                              color: isDarkTheme(context) == true
                                  ? Colors.white
                                  : Colors.black,
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
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: getHeight(context) * 0.01,
                  horizontal: getWidth(context) * 0.01),
              width: getWidth(context) * .2,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: validateEmail,
                controller: _email,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  errorText: validateEmail(_email.text),
                  errorStyle: TextStyle(color: Colors.red.shade400),
                  labelText: 'Email',
                  filled: true,
                  fillColor: isDarkTheme(context) == true
                      ? Colors.black87
                      : Colors.grey.shade200,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    // borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getWidth(context) * 0.03,
            ),
            SizedBox(
                width: getWidth(context),
                child: CustomElevatedBtn(
                  height: getHeight(context) * 0.06,
                  radius: 18,
                  foregroundColor: LIGHT_COLOR,
                  backgroundColor: LIGHT_SEC_COLOR,
                  child: const Text(
                    'Send Email',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () async {
                    try {
                      await FIRE_BASE
                          .sendPasswordResetEmail(email: _email.text.trim());
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('$e')),
                      );
                    }
                  },
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
                            children: <TextSpan>[
                          TextSpan(
                              text: 'Return to ',
                              style: TextStyle(
                                  color: isDarkTheme(context) == true
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16)),
                          const TextSpan(
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
