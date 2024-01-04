import 'package:coincontrol/imports.dart';

class InvestmentContoller {
  Future<List<Map<String, dynamic>>> fetchingPlans() async {
    List<Map<String, dynamic>> lists = [];
    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection("investment_plans").get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in data.docs) {
      lists.add(document.data()!);
    }
    return lists;
  }
}
