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

  // Sending Data in forms table
  Future<void> sendingForms(
      {String? job,
      String? income,
      String? expense,
      String? investment,
      String? returns,
      String? mems,
      String? savings}) async {
    Map<String, dynamic> payload = {
      'job': job,
      'income': income,
      'expense': expense,
      'investment': investment,
      'returns': returns,
      'savings': savings,
      'family_members': mems,
    };
    await FIRE_STORE.collection('collectionPath').add(payload);
  }
}
