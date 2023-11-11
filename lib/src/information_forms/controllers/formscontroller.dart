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
}
