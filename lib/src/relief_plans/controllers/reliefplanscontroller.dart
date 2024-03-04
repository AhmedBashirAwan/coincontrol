import 'package:coincontrol/imports.dart';

class ReliefPlansControllers {
  //fetching all relief plans
  Future<List<Map<String, dynamic>>> fetchingAllReliefPlans() async {
    List<String> applies = [];
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('users_ReliefPlans')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in data.docs) {
      applies.add(document.data()['title']);
    }
    List<Map<String, dynamic>> lists = [];
    QuerySnapshot<Map<String, dynamic>> docis =
        await FirebaseFirestore.instance.collection('relief_Plans').get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> document in docis.docs) {
      if (applies.isEmpty) {
        lists.add(document.data());
      } else {
        for (var element in applies) {
          if (document['title'] != element) {
            lists.add(document.data());
          }
        }
      }
    }
    return lists;
  }

  //sending applied relief plans
  Future<void> applyReliefs(Map<String, dynamic> payload) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('users_ReliefPlans')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('title', isEqualTo: payload['title'])
        .get();
    if (data.docs.isEmpty) {
      await FirebaseFirestore.instance
          .collection('users_ReliefPlans')
          .add(payload);
    } else {
      print('Already Applied in this plan');
    }
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
