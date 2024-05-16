// ignore_for_file: use_build_context_synchronously
import '../../../imports.dart';

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

  // Future<void> facebookAuth() async {
  //   Future<UserCredential> signInWithFacebook() async {
  //     // Trigger the sign-in flow
  //     final LoginResult loginResult = await FacebookAuth.instance.login();
  //     // Create a credential from the access token
  //     final OAuthCredential facebookAuthCredential =
  //         FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //     // Once signed in, return the UserCredential
  //     return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  //   }
  // }
}
