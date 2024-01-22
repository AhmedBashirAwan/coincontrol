import 'package:coincontrol/imports.dart';

class FormsController {
  //updating user credentials in database
  Future<void> updatingStatus() async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('userCredentials')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (data.docs.isNotEmpty) {
      var documentId = data.docs.first.id;
      await FirebaseFirestore.instance
          .collection('userCredentials')
          .doc(documentId)
          .update({'new_User': false});
    } else {
      // Handle the case where no document is found for the given user ID.
      print(
          "No document found for user ID: $FirebaseAuth.instance.currentUser!.uid");
    }
  }

  //Sending data in forms
  Future<void> sendingData(
      {String? job,
      String? mems,
      String? income,
      String? savings,
      String? condition,
      String? rent,
      String? bills,
      String? transportation,
      String? groceries,
      String? education,
      String? others,
      String? otherIncomes,
      String? investmentReturns,
      String? debts}) async {
    Map<String, dynamic> payload = {
      'user_ID': FirebaseAuth.instance.currentUser!.uid,
      'job': job,
      'family_members': mems,
      'income': income,
      'savings': savings,
      'condition': condition,
      'debts': debts,
      'other_Income': otherIncomes,
      'investment_Returns': investmentReturns,
    };
    Map<String, dynamic> data = {
      'user_ID': FirebaseAuth.instance.currentUser!.uid,
      'rent': rent,
      'bills': bills,
      'transportation': transportation,
      'groceries': groceries,
      'education': education,
      'others': others,
    };
    await FirebaseFirestore.instance.collection('personal_Info').add(payload);
    await FirebaseFirestore.instance.collection('finance_Info').add(data);
  }
}
