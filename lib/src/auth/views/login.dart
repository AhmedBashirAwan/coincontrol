import 'package:coincontrol/src/auth/components/buttons.dart';
import 'package:coincontrol/src/auth/components/sociallinks.dart';
import 'package:coincontrol/src/auth/components/textfields.dart';
import 'package:coincontrol/src/auth/views/createaccount.dart';
import 'package:coincontrol/src/auth/views/forgetpassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../block/appblock.dart';
import '../../../constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: getHeight(context) * 0.03,
                ),
                Text('Coin Control', style: heading(25)),
                SizedBox(
                  height: getHeight(context) * 0.08,
                ),
                Fields(
                  background: Colors.black38,
                  controller: _email,
                  radius: 10,
                  hint: 'Email',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Fields(
                    obscure: true,
                    background: Colors.black38,
                    controller: _password,
                    radius: 10,
                    hint: 'Password',
                  ),
                ),
                SizedBox(
                    width: getWidth(context),
                    child: CustomElevatedBtn(
                      height: getHeight(context) * 0.06,
                      radius: 10,
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.pink,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () async {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email.text, password: _password.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUP(),
                          ),
                        );
                      },
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
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
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color:
                                        appBloc.brightness == Brightness.light
                                            ? Colors.black
                                            : Colors.white),
                                children: const <TextSpan>[
                              // TextSpan(
                              //     text: 'Forget Password?',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.w200, fontSize: 11)),
                              TextSpan(
                                  text: 'Forget Password?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11)),
                              // TextSpan(
                              //     text: 'and ',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.w300, fontSize: 11)),
                              // TextSpan(
                              //     text: 'Privacy Policy',
                              //     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11)),
                            ])),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(children: const <Widget>[
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    )),
                    Text(
                      "OR",
                      style: TextStyle(fontSize: 10),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        thickness: 0.5,
                      ),
                    )),
                  ]),
                ),
                Links(
                  height: getHeight(context) * 0.05,
                  radius: 12,
                  icon: const Icon(Icons.email_outlined),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  text: 'Signin with google',
                ),
                SizedBox(
                  height: getHeight(context) * 0.02,
                ),
                Links(
                  height: getHeight(context) * 0.05,
                  radius: 12,
                  icon: const Icon(Icons.email_outlined),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  text: 'Signin with Facebook',
                ),
                SizedBox(
                  height: getHeight(context) * 0.02,
                ),
                Links(
                  height: getHeight(context) * 0.05,
                  radius: 12,
                  icon: const Icon(Icons.email_outlined),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  text: 'Signin with Email',
                ),
                SizedBox(
                  height: getHeight(context) * 0.1,
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
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUP(),
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
                            text: 'Dont have an Account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 11)),
                        TextSpan(
                            text: 'SignUp',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11)),
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
