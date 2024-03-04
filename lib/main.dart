import 'package:coincontrol/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<ApplicationBloc>(context).getTheme(),
        home:
            // FutureBuilder<void>(
            // builder: (context, snapshot) {
            // if (FirebaseAuth.instance.currentUser != null) {
            //   return Dashboard(
            //     uid: FirebaseAuth.instance.currentUser!.uid,
            //   );
            // } else {
            // return
            const Login()
        // }
        // },
        // ),
        );
  }
}
