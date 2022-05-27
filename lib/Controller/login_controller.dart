import 'package:discipulus/Screens/ChatHomeScreen.dart';
import 'package:discipulus/View/SignUpScreen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:discipulus/Model/constants.dart';
import 'package:discipulus/View/dashboard.dart';
import 'package:discipulus/View/userDetailsAdd.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there

    firebaseUser = Rx<User?>(auth.currentUser);
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);


    firebaseUser.bindStream(auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);


    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
    ever(check, _checkUserDetails);

  }
  _checkUserDetails(int? check){
    if(check==2)
      {
        Get.offAll(UserDetailsAdd());
      }
    else{
      Get.offAll(HomePage());

    }
  }
  _setInitialScreen(User? user) {
    if (user == null) {

      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => ChatHomeScreen());

    } else {

      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomePage());

    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => SignUpScreen());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomePage());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (firebaseAuthException) {}
  }

  void signOut() async {
    await auth.signOut();
  }
}

// class LoginController extends GetxController {
//    var isSignedIn = false.obs;
//
//   var _googleSignin = GoogleSignIn();
//   var googleAccount = Rx<GoogleSignInAccount?>(null);
//     static LoginController instance = Get.find();
//   FirebaseAuth auth = FirebaseAuth.instance;
//   @override
//
//   login()async{
//     googleAccount.value =await _googleSignin.signIn();
//     final googleSignInAuthentication = await googleAccount.value!.authentication;
//       final AuthCredential creds = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken
//       );
//           // final authResult = await _auth.signInWithCredential(creds);
//       await FirebaseAuth.instance.signInWithCredential(creds);
//       auth=FirebaseAuth.instance;
//    isSignedIn.toggle();
//
//   }
//   logout()async{
//     googleAccount.value =await _googleSignin.signOut();
//     await FirebaseAuth.instance.signOut();
//    isSignedIn.toggle();
//
//   }
//
// }