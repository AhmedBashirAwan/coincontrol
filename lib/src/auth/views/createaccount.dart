import 'package:coincontrol/src/auth/controllers/authcontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';
import '../../../imports.dart';
import '../components/buttons.dart';
import '../components/sociallinks.dart';
import '../components/textfields.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _confirm = TextEditingController();

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
                  controller: _name,
                  radius: 10,
                  hint: 'Name',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Fields(
                    background: Colors.black38,
                    controller: _email,
                    radius: 10,
                    hint: 'Email',
                  ),
                ),
                Fields(
                  obscure: true,
                  background: Colors.black38,
                  controller: _password,
                  radius: 10,
                  hint: 'Password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Fields(
                    obscure: true,
                    background: Colors.black38,
                    controller: _confirm,
                    radius: 10,
                    hint: 'Confirm Password',
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
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: () async {
                       UserCredential credential= await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _email.text, password: _password.text);
                       await Authcontroller().addingUser(
                          email: _email.text.trim(),
                          name: _name.text.trim(),
                          uID: credential.user!.uid.toString() 
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      },
                    )),
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
                SizedBox(
                  height: getHeight(context) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getHeight(context) * 0.08,
                      width: getWidth(context) * 0.22,
                      child: Links(
                        radius: 12,
                        icon: const Icon(Icons.email_outlined),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.05,
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.08,
                      width: getWidth(context) * 0.22,
                      child: Links(
                        radius: 12,
                        icon: const Icon(Icons.email_outlined),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: getWidth(context) * 0.05,
                    ),
                    SizedBox(
                      height: getHeight(context) * 0.08,
                      width: getWidth(context) * 0.22,
                      child: Links(
                        radius: 12,
                        icon: const Icon(Icons.email_outlined),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        // text: 'Signin with Email',
                      ),
                    ),
                  ],
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
                            text: 'Already Have an account? ',
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
        ),
      ),
    );
  }
}
