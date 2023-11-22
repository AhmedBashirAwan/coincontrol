import 'package:coincontrol/imports.dart';

class DashboardController {
  Future<Map<String, dynamic>> fetchingUsersCredentials() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FIRE_STORE
        .collection('userCredentials')
        .where("user_ID", isEqualTo: USER_ID)
        .get();

    if (userData.docs.isNotEmpty) {
      print(userData.docs.first.data());
      // setState(() {
      //   credentials = userData.docs.first.data();
      // });
      return userData.docs.first.data();
    } else {
      // Handle the case where no document is found for the given user ID.
      print("No document found for user ID: $USER_ID");
      return {}; // or null, depending on how you want to handle this case
    }
  }

}
