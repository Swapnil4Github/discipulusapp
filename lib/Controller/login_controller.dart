import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  login()async{
    googleAccount.value =await _googleSignin.signIn();
    final googleSignInAuthentication = await googleAccount.value!.authentication;
      final AuthCredential creds = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
      );
          // final authResult = await _auth.signInWithCredential(creds);
      await FirebaseAuth.instance.signInWithCredential(creds);
      auth=FirebaseAuth.instance;
  }
  logout()async{
    googleAccount.value =await _googleSignin.signOut();
    await FirebaseAuth.instance.signOut();

  }

}