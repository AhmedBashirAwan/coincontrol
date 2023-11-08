import 'package:coincontrol/src/auth/views/forgetpassword.dart';
import 'package:coincontrol/src/auth/views/login.dart';
import 'package:coincontrol/src/auth/views/signUp.dart';
import 'package:coincontrol/src/auth/views/verification.dart';
import 'package:coincontrol/src/dashboard/views/dashboard.dart';
import 'package:coincontrol/src/information_forms/views/forms.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'block/appblock.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ApplicationBloc>(context).getTheme(),
      home: const Login(),
    );
  }
}
