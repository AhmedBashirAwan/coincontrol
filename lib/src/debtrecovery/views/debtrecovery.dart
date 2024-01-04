import 'package:coincontrol/imports.dart';

class DebtRecovery extends StatefulWidget {
  const DebtRecovery({super.key});

  @override
  State<DebtRecovery> createState() => _DebtRecoveryState();
}

class _DebtRecoveryState extends State<DebtRecovery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        elevation: 5,
        title: const Text(
          'Debt Recovery',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor:
            isDarkTheme(context) == true ? Colors.black : LIGHT_SEC_COLOR,
      ),
      body: const SafeArea(
          child: Center(
              child: Text(
        "Debt Recovery",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ))),
    );
  }
}
