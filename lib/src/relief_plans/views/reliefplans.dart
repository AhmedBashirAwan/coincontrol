import 'package:coincontrol/imports.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReliefPlans extends StatefulWidget {
  const ReliefPlans({super.key});

  @override
  State<ReliefPlans> createState() => _ReliefPlansState();
}

class _ReliefPlansState extends State<ReliefPlans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Expanded(child: Center(child: Text('Coming Soon...')))],
      ),
    );
  }
}
