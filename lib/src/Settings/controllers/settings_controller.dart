import '../../../imports.dart';

class SettingsController {
  //fetching all the signup credentials of current user
  Future<Map<String, dynamic>> fetchingUsersCredentials() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
        .collection('userCredentials')
        .where("user_ID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userData.docs.isNotEmpty) {
      return userData.docs.first.data();
    } else {
      return {};
    }
  }

  //editing all of the personal info of the current user
  Future<void> editingProfile(Map<String, dynamic> payload) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('userCredentials')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    QueryDocumentSnapshot<Map<String, dynamic>> document = data.docs.first;
    document.reference.update(payload);
  }

  // fetching all of the personal Information
  Future<Map<String, dynamic>> fetchingPersonalInfo() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
        .collection('personal_Info')
        .where("user_ID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userData.docs.isNotEmpty) {
      return userData.docs.first.data();
    } else {
      return {};
    }
  }

  //updating all the personal Informations
  Future<void> editingPersonalInfo(Map<String, dynamic> payload) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('personal_Info')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    QueryDocumentSnapshot<Map<String, dynamic>> document = data.docs.first;
    document.reference.update(payload);
  }

  //fetching all of the financial information of the current User
  Future<Map<String, dynamic>> fetchingFinancialInfo() async {
    QuerySnapshot<Map<String, dynamic>> userData = await FirebaseFirestore.instance
        .collection('finance_Info')
        .where("user_ID", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (userData.docs.isNotEmpty) {
      return userData.docs.first.data();
    } else {
      return {};
    }
  }

  //editing all the financial informations
  Future<void> editingFinancialInfo(Map<String, dynamic> payload) async {
    QuerySnapshot<Map<String, dynamic>> data = await FirebaseFirestore.instance
        .collection('finance_Info')
        .where('user_ID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    QueryDocumentSnapshot<Map<String, dynamic>> document = data.docs.first;
    document.reference.update(payload);
  }
}
