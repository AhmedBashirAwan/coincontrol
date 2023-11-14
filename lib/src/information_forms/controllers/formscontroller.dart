import 'package:coincontrol/imports.dart';

class FormsController {
  //updating user credentials in database
  Future<void> updatingStatus() async {
    QuerySnapshot<Map<String, dynamic>> data = await FIRE_STORE
        .collection('userCredentials')
        .where('user_ID', isEqualTo: USER_ID)
        .get();

    if (data.docs.isNotEmpty) {
      var documentId = data.docs.first.id;
      await FIRE_STORE
          .collection('userCredentials')
          .doc(documentId)
          .update({'new_User': false});
    } else {
      // Handle the case where no document is found for the given user ID.
      print("No document found for user ID: $USER_ID");
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
      'user_ID': FIRE_BASE.currentUser!.uid,
      'job': job,
      'family_members': mems,
      'income': income,
      'savings': savings,
      'condition': condition,
    };
    Map<String, dynamic> data = {
      'user_ID': FIRE_BASE.currentUser!.uid,
      'rent': rent,
      'bills': bills,
      'transportation': transportation,
      'groceries': groceries,
      'education': education,
      'others': others,
      'debts': debts,
      'other_Income': otherIncomes,
      'investment_Returns': investmentReturns,
    };
    await FIRE_STORE.collection('personal_Info').add(payload);
    await FIRE_STORE.collection('finance_Info').add(data);
  }
}
