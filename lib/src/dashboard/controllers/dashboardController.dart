
import '../../../imports.dart';

class DashboardController {

  //fetching current users all credentials 
  Future<Map<String, dynamic>> fetchingUsersCredentials() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
        .collection('userCredentials')
        .where("user_ID", isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();

    if (userData.docs.isNotEmpty) {
      // setState(() {
      //   credentials = userData.docs.first.data();
      // });
      return userData.docs.first.data();
    } else {
      // Handle the case where no document is found for the given user ID.
      return {}; // or null, depending on how you want to handle this case
    }
  }

}
