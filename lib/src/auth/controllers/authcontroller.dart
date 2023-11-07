// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coincontrol/src/auth/views/signUp.dart';
import 'package:coincontrol/src/dashboard/views/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../imports.dart';
import '../views/verification.dart';

class Authcontroller {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> googleAuth() async {
    final googleUser = await GoogleSignIn(
      signInOption: SignInOption.games,
    ).signIn();

    final googleAuth = await googleUser?.authentication;
    if (googleAuth != null) {
      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  Future<void> facebookAuth() async {
    Future<UserCredential> signInWithFacebook() async {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
  }
}
