import 'package:coincontrol/imports.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        .hasMatch(_pass.text))) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be 6-20 characters long';
    }

    return null;
  }

  // method for validating confirm pass
  String? valiadateConfirmPass(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 8 characters';
    } else if (value.length > 15) {
      return 'Password must be less then 15 characters';
    } else if ((!RegExp(
            "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@!%*?&])[A-Za-z\\d@!%*?&]{8,15}")
        .hasMatch(_confirm.text))) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, one number, one special character, and be 6-20 characters long';
    } else if (_pass.text != _confirm.text) {
      return "Both password should be same";
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool _isNotValidate = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirm = TextEditingController();

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      // backgroundColor: const Color(0xFFEFE1DD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                        height: getHeight(context) * 0.15,
                        child: Image.asset("lib/assets/logo.png")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('AI Finance Control',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4B5648))),
                      ],
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.03,
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
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: getHeight(context) * 0.01,
                          horizontal: getWidth(context) * 0.01),
                      width: getWidth(context) * .2,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: validatePassword,
                        controller: _pass,
                        obscureText: obscure,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          // errorText: validateEmail(_email.text),
                          errorStyle: TextStyle(color: Colors.red.shade400),
                          labelText: 'Password',
                          filled: true,
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
                              child: const Icon(Icons.remove_red_eye_outlined)),
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
                      height: getHeight(context) * 0.015,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Color(0xFF72665D),
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.015,
                    ),
                    SizedBox(
                        width: getWidth(context),
                        child: CustomElevatedBtn(
                            height: getHeight(context) * 0.06,
                            radius: 18,
                            foregroundColor: LIGHT_COLOR,
                            backgroundColor: LIGHT_SEC_COLOR,
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () async {
                              try {
                                UserCredential credentialss =
                                    await FIRE_BASE.signInWithEmailAndPassword(
                                        email: _email.text.trim(),
                                        password: _pass.text.trim());

                                QuerySnapshot<Map<String, dynamic>> data =
                                    await FirebaseFirestore.instance
                                        .collection('userCredentials')
                                        .where('user_ID',
                                            isEqualTo: credentialss.user!.uid)
                                        .get();

                                if (data.docs.first.data()['new_User'] ==
                                        true &&
                                    data.docs.first
                                        .data()
                                        .containsKey('new_User')) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => InformationForms(
                                        uid: credentialss.user!.uid,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(
                                        uid: credentialss.user!.uid,
                                      ),
                                    ),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('$e')),
                                );
                              }
                            })),
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
                      onTap: () async {
                        final googleUser = await GoogleSignIn(
                          signInOption: SignInOption.games,
                        ).signIn();

                        final googleAuth = await googleUser?.authentication;
                        if (googleAuth != null) {
                          // Create a new credential
                          final credential = GoogleAuthProvider.credential(
                            accessToken: googleAuth.accessToken,
                            idToken: googleAuth.idToken,
                          );

                          // Once signed in, return the UserCredential
                          await FIRE_BASE.signInWithCredential(credential);
                        }
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
                      text: 'Signin with google',
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.01,
                    ),
                    Links(
                      onTap: () async {
                        Future<UserCredential> signInWithFacebook() async {
                          // Trigger the sign-in flow
                          final LoginResult loginResult =
                              await FacebookAuth.instance.login();
                          // Create a credential from the access token
                          final OAuthCredential facebookAuthCredential =
                              FacebookAuthProvider.credential(
                                  loginResult.accessToken!.token);
                          // Once signed in, return the UserCredential
                          return FIRE_BASE
                              .signInWithCredential(facebookAuthCredential);
                        }
                      },
                      height: getHeight(context) * 0.06,
                      radius: 18,
                      image: SizedBox(
                          height: getHeight(context) * 0.05,
                          width: getWidth(context) * 0.06,
                          child: FittedBox(
                              child: Image.asset("lib/assets/facebook.png"))),
                      icon: const Icon(Icons.email_outlined),
                      backgroundColor: isDarkTheme(context) == true
                          ? Colors.grey.shade800
                          : const Color(0xFFCBBCB1),
                      foregroundColor: isDarkTheme(context) == true
                          ? Colors.white
                          : Colors.black,
                      text: 'Signin with Facebook',
                    ),
                 
                  ],
                ),
              ),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp_new(),
                        ),
                      );
                    },
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'Dont have an Account? ',
                          style: TextStyle(
                              color: isDarkTheme(context) == true
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 16)),
                      const TextSpan(
                          text: 'SignUp',
                          style: TextStyle(
                              color: Color(0xFFAA553C),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ])),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
