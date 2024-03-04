import 'package:flutter/material.dart';

import '../../../theme/colors.dart';

class CustomerSupport extends StatefulWidget {
  const CustomerSupport({super.key});

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: LIGHT_PRI_COLOR,
      body: const SafeArea(
          child: Center(
        child: Text('Customer care is coming soon...'),
      )),
    );
  }
}
