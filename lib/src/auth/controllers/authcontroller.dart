import 'package:cloud_firestore/cloud_firestore.dart';

class Authcontroller {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addingUser({String? email, String? name, String? uID}) async {
    await firestore
        .collection('userCredentials')
        .add({'name': name, 'email': email, 'user_ID': uID});
  }
}
