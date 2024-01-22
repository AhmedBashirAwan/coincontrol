import 'package:coincontrol/imports.dart';

class SignUp_new extends StatefulWidget {
  const SignUp_new({super.key});

  @override
  State<SignUp_new> createState() => _SignUp_newState();
}

class _SignUp_newState extends State<SignUp_new> {
  final _formKey = GlobalKey<FormState>();
  bool obscure = true;
  bool isEmailVerified = false;
  bool confirmationObsecure = true;
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _confirm = TextEditingController();
  final TextEditingController _name = TextEditingController();

  // method for validating email
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

  // method for validating password
  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 15) {
      return 'Password must be less then 15 characters';
    } else if ((!RegExp(
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@!%*?&])[A-Za-z\\d@!%*?&]{8,15}")
        .hasMatch(_password.text))) {
      return 'Password must contain at least one uppercase, \none lowercase letter, one number, one special character, \nand be 6-20 characters long';
    }

    return null;
  }

  // method for validating Confirm pass
  String? valiadateConfirmPass(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (_confirm.text != _password.text) {
      return "Both password should be same";
    }
  }

  //Adding userdetails to the database
  Future<void> addUserDetails({
    String? uid,
    String? fullName,
    String? email,
  }) async {
    Map<String, dynamic> payload = {
      'user_ID': FirebaseAuth.instance.currentUser!.uid,
      'new_User': true,
      'email': email,
      'name': fullName,
    };
    await FirebaseFirestore.instance.collection('userCredentials').add(payload);
  }

  final bool _isNotValidate = false;

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    

    return Scaffold(
      // backgroundColor: LIGHT_PRI_COLOR,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: getHeight(context) * 0.07,
              ),
              const Row(
                children: [
                  Text('Create Account',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4B5648),
                      )),
                ],
              ),
              SizedBox(
                height: getHeight(context) * 0.02,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: getHeight(context) * 0.01,
                            horizontal: getWidth(context) * 0.01),
                        width: getWidth(context),
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z]+|\s'))
                          ],
                          controller: _name,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            errorText: _isNotValidate
                                ? "Enter Proper information"
                                : null,
                            errorStyle: TextStyle(color: Colors.red.shade400),
                            labelText: 'Name',
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: getHeight(context) * 0.01,
                            horizontal: getWidth(context) * 0.01),
                        width: getWidth(context),
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: getHeight(context) * 0.01,
                            horizontal: getWidth(context) * 0.01),
                        width: getWidth(context),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: validatePassword,
                          controller: _password,
                          obscureText: obscure,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (obscure == true) {
                                      obscure = false;
                                    } else {
                                      obscure = true;
                                    }
                                  });
                                },
                                child:
                                    const Icon(Icons.remove_red_eye_outlined)),
                            errorText: validateEmail(_email.text),
                            errorStyle: TextStyle(color: Colors.red.shade400),
                            labelText: 'Password',
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
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: getHeight(context) * 0.01,
                            horizontal: getWidth(context) * 0.01),
                        width: getWidth(context),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: valiadateConfirmPass,
                          controller: _confirm,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          obscureText: confirmationObsecure,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    if (confirmationObsecure == true) {
                                      confirmationObsecure = false;
                                    } else {
                                      confirmationObsecure = true;
                                    }
                                  });
                                },
                                child:
                                    const Icon(Icons.remove_red_eye_outlined)),
                            errorText: validateEmail(_email.text),
                            errorStyle: TextStyle(color: Colors.red.shade400),
                            labelText: 'Confirm Password',
                            filled: true,
                            fillColor: isDarkTheme(context) == true
                                ? Colors.black87
                                : Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              // borderSide: BorderSide(width: 0.1),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                            width: getWidth(context),
                            child: CustomElevatedBtn(
                              height: getHeight(context) * 0.06,
                              radius: 18,
                              foregroundColor: LIGHT_COLOR,
                              backgroundColor: LIGHT_SEC_COLOR,
                              child: const Text(
                                'Create',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate() ==
                                    false) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Invalide Credentials')),
                                  );
                                } else {
                                  try {
                                    UserCredential credential = await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: _email.text.trim(),
                                            password: _password.text.trim());
                                    if (credential != null) {
                                      addUserDetails(
                                        email: _email.text.trim(),
                                        uid: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        fullName: _name.text.trim(),
                                      );
                                      FirebaseAuth.instance.currentUser
                                          ?.sendEmailVerification();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'We have sent an email to ${credential.user!.email}.')),
                                      );
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (BuildContext context) {
                                      //       return AlertDialog(
                                      //         title: Row(
                                      //           children: [
                                      //             Text("Verify your Email"),
                                      //           ],
                                      //         ),
                                      //         content: SizedBox(
                                      //           height: 100,
                                      //           child: Column(
                                      //             children: [
                                      //               isEmailVerified
                                      //                   ? Text(
                                      //                       'Your Email is Verified')
                                      //                   : Text(
                                      //                       "We have Sent you an email."),
                                      //               isEmailVerified
                                      //                   ? Icon(
                                      //                       Icons
                                      //                           .verified_outlined,
                                      //                       size: 50,
                                      //                     )
                                      //                   : CircularProgressIndicator(
                                      //                       color: Colors.black,
                                      //                     ),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       );
                                      //     });

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Login(),
                                        ),
                                      );
                                    }
                                  } catch (e) {
                                    print(e);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Registeration Failed')),
                                    );
                                  }
                                }
                              },
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                color: LIGHT_SEC_COLOR,
                                thickness: 0.5,
                              ),
                            ),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 10,
                              color: LIGHT_SEC_COLOR,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(
                                color: LIGHT_SEC_COLOR,
                                thickness: 0.5,
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Links(
                        onTap: () {
                          Authcontroller().googleAuth();
                        },
                        height: getHeight(context) * 0.06,
                        radius: 18,
                        image: CircleAvatar(
                            radius: getHeight(context) * 0.018,
                            child: Image.asset("lib/assets/google.png")),
                        backgroundColor: isDarkTheme(context) == true
                            ? Colors.grey.shade800
                            : const Color(0xFFCBBCB1),
                        foregroundColor: isDarkTheme(context) == true
                            ? Colors.white
                            : Colors.black,
                        text: 'Continue with google',
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                  text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an Account? ',
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
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
