import 'package:discipulus/Controller/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import '../Controller/login_controller.dart';

AuthController authController = AuthController.instance;
UserController usercontroller2 = Get.put(UserController());

final Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
FirebaseAuth auth = FirebaseAuth.instance;
RxInterface<int?> check = 0.obs ;
GoogleSignIn googleSign = GoogleSignIn();
var emailController2 = TextEditingController();
var passwordController2 = TextEditingController();
var nameController2 = TextEditingController();
var genderController2 = TextEditingController();
var collegeNameController2 = TextEditingController();
var degreeController2 = TextEditingController();
var addressController2 = TextEditingController();
var contactNumberController2 = TextEditingController();
var descriptionController2 = TextEditingController();
