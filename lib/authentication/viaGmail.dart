// import 'dart:js';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:discipulus/SignUpScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class LoginController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//
//   loginWithGoogle() async {
//       final GoogleSignInAccount? googleSignInAccount =
//       await googleSignIn.signIn();
//       final googleSignInAuthentication = await googleSignInAccount!.authentication;
//       final AuthCredential creds = GoogleAuthProvider.credential(
//           accessToken: googleSignInAuthentication.accessToken,
//           idToken: googleSignInAuthentication.idToken
//       );
//       // final AuthCredential credential = GoogleAuthProvider.getCredential(
//       //   accessToken: googleSignInAuthentication.accessToken,
//       //   idToken: googleSignInAuthentication.idToken,
//       // );
//       final authResult = await _auth.signInWithCredential(creds);
//       await FirebaseAuth.instance.signInWithCredential(creds);
//
//       // await FirebaseAuth.instance.signInWithCredential(creds).then((value) => Get.offAll(Dashboard(),arguments: _auth.currentUser));
//     // final User? user = authResult.user;
//       // assert(await user?.getIdToken() != null);
//       // final User? currentUser = _auth.currentUser;
//       // assert(user?.uid == currentUser?.uid);
//       // Get.to
//       // return Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //     children: [
//       //       CircleAvatar(
//       //         backgroundImage: NetworkImage(googleSignInAccount.photoUrl.toString()),
//       //       ),
//       //       Text(googleSignInAccount.displayName.toString()),
//       //       SizedBox(height: 30,),
//       //       GestureDetector(
//       //         onTap: ()async{
//       //           await googleSignIn.signOut();
//       //           await FirebaseAuth.instance.signOut();
//       //
//       //         },
//       //         child: const Padding(padding: EdgeInsets.all(8.0),
//       //           child: Text('Logout'),),
//       //
//       //       )
//       //     ],
//       //   ),
//       //
//       // );
//     }
//
//
//   // Future<void> logoutGoogle() async {
//   //   await googleSignIn.signOut();
//   //   Get.back(); // navigate to your wanted page after logout.
//   // }
//
// }
// // class Dashboard extends StatefulWidget {
// //   const Dashboard({Key? key}) : super(key: key);
// //
// //   @override
// //   _DashboardState createState() => _DashboardState();
// // }
//
// // class _DashboardState extends State<Dashboard> {
// //   late User user;
// //   @override
// //   void onInit() async {
// //     user = Get.arguments;
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Center(
// //       child: Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //       CircleAvatar(
// //       backgroundImage: NetworkImage(user.photoURL.toString()),
// //       ),
// //       Text(user.displayName.toString()),
// //       SizedBox(height: 30,),
// //       GestureDetector(
// //       onTap: ()async{
// //       await googleSignIn.signOut();
// //       await FirebaseAuth.instance.signOut();
// //
// //       },
// //       child: const Padding(padding: EdgeInsets.all(8.0),
// //       child: Text('Logout'),),
// //
// //       )
// //       ],
// //       ),
// //
// //       ),
// //     );
// //   }
// // }
//
// // class AuthController extends GetxController {
// //   static AuthController instance = Get.find();
// //   GoogleSignIn _googleSignIn = GoogleSignIn();
// //   FirebaseAuth _check = FirebaseAuth.instance;
// //   late Rx<User?> _user;
// //
// //   @override
// //   void onReady()
// //   {
// //     super.onReady();
// //     _user = auth.currentUser as Rx<User?>;
// //     _user.bindStream(auth.userChanges());
// //     ever(_user,_initialScreen);
// //   }
// //   void signInGmail()async{
// //     final newuser = await _googleSignIn.signIn();
// //     final googleauth = await newuser!.authentication;
// //     final creds = GoogleAuthProvider.credential(
// //         accessToken: googleauth.accessToken,
// //         idToken: googleauth.idToken
// //     );
// //     await FirebaseAuth.instance.signInWithCredential(creds);
// //
// //   }
// //
// //
// //
// //
// // }
//
//
//
//
// // Center(
// // child: Column(
// // mainAxisAlignment: MainAxisAlignment.center,
// // children: [
// // CircleAvatar(
// // backgroundImage: NetworkImage(snapshot.data!.photoURL.toString()),
// // ),
// // Text(snapshot.data!.displayName.toString()),
// // SizedBox(height: 30,),
// // GestureDetector(
// // onTap: ()async{
// // await _googleSignIn.signOut();
// // await FirebaseAuth.instance.signOut();
// //
// // },
// // child: const Padding(padding: EdgeInsets.all(8.0),
// // child: Text('Logout'),),
// //
// // )
// // ],
// // ),
// //
// // );