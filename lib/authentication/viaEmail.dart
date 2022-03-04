import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:discipulus/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthController extends GetxController{


  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void onReady()
  {
    super.onReady();
    _user = auth.currentUser as Rx<User?>;
    _user.bindStream(auth.userChanges());
    ever(_user,_initialScreen);
  }
  _initialScreen(User? user){
    if(user==null)
      {
        print("Login page");
        Get.offAll(()=>SignUpScreen());
      }
    else
      {
        Get.offAll(()=>SignUpScreen());
      }

  }
  void register(String email, password, username){
    try{
      auth.createUserWithEmailAndPassword(email: email, password: password);
    }
    catch(e)
    {
      Get.snackbar("About User", "User message",
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.BOTTOM,
      titleText: Text(
        "Account Creation Failed",
        style: TextStyle(
          color: Colors.white
        ),
      ),
      messageText: Text(e.toString(),
      style: TextStyle(
          color: Colors.white
      ),));
    }
  }
}
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
