import 'package:coincontrol/imports.dart';

class ReliefPlansControllers {
  //fetching all relief plans
  Future<List<Map<String, dynamic>>> fetchingAllReliefPlans() async {
    List<Map<String, dynamic>> lists = [];
    QuerySnapshot<Map<String, dynamic>> data =
        await FirebaseFirestore.instance.collection('relief_Plans').get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in data.docs) {
      lists.add(document.data());
    }
    return lists;
  }

  //sending applied relief plans
  Future<void> applyReliefs(Map<String, dynamic> payload) async {
    await FirebaseFirestore.instance
        .collection('users_ReliefPlans')
        .add(payload);
  }

  //fetching users applied plans
  Future<List<Map<String, dynamic>>> fetchingAppliedReliefs() async {
    List<Map<String, dynamic>> lists = [];
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('users_ReliefPlans')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in data.docs) {
      lists.add(document.data());
    }
    return lists;
  }
}
