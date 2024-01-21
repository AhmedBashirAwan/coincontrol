import 'package:coincontrol/imports.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                      children: [
                        SizedBox(
                          width: getWidth(context) * 0.8,
                          child: const Text('AI Finance Control',
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 37,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4B5648))),
                        ),
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
                        controller: _email,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
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
                        controller: _pass,
                        obscureText: obscure,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
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
                                UserCredential credentialss = await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: _email.text.trim(),
                                        password: _pass.text.trim());
                                if (credentialss.user!.emailVerified &&
                                    FirebaseAuth.instance.currentUser != null) {
                                  QuerySnapshot<Map<String, dynamic>> data =
                                      await FirebaseFirestore.instance
                                          .collection('userCredentials')
                                          .where('user_ID',
                                              isEqualTo: credentialss.user!.uid)
                                          .get();

                                  if (data.docs.first.data()['new_User'] ==
                                      true) {
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
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Kindly Verify Your Email. Through the link we have sent.')),
                                  );
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Recheck and enter the correct Email')),
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
                      onTap: () {
                        Future<UserCredential?> signInWithGoogle() async {
                          try {
                            // Trigger the authentication flow
                            final GoogleSignInAccount? googleUser =
                                await GoogleSignIn().signIn();

                            // Obtain the auth details from the request
                            final GoogleSignInAuthentication? googleAuth =
                                await googleUser?.authentication;

                            // Create a new credential
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth?.accessToken,
                              idToken: googleAuth?.idToken,
                            );

                            // Once signed in, return the UserCredential
                            UserCredential credentialss = await FirebaseAuth
                                .instance
                                .signInWithCredential(credential);

                            // Query Firestore to check if the user is new
                            QuerySnapshot<Map<String, dynamic>> data =
                                await FirebaseFirestore.instance
                                    .collection('userCredentials')
                                    .where('user_ID',
                                        isEqualTo: credentialss.user!.uid)
                                    .get();
                            if (data.docs.first.data()['new_User'] == true) {
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
                            return credentialss; // Return the UserCredential here if needed
                          } catch (e) {
                            print('Error signing in with Google: $e');
                            // Handle the error as needed
                            return null; // Return null or throw an exception, depending on your error handling strategy
                          }
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
