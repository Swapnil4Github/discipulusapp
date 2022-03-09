import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/constants.dart';
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         color: Colors.grey,
//         child: Center(
//           child: Container(
//             color: Colors.black,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircleAvatar(
//                   backgroundImage: Image.network(authController.firebaseUser.value?.photoURL ?? '').image,
//                   radius: 100,
//                 ),
//                 Text(authController.firebaseUser.value?.displayName ?? '',
//                   style: Get.textTheme.headlineSmall,
//                 ),
//                 Text(authController.firebaseUser.value?.email ?? '',
//                     style: Get.textTheme.bodyText1),
//
//                 GestureDetector(
//                   onTap: ()async{
//                     authController.signOut();
//                     googleSign.signOut();
//                   },
//                   child: Text("Log Out",
//                     style: Get.textTheme.bodyText1,
//                   ),
//                 ),
//
//               ],
//
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.deepPurple,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: Image.network(authController.firebaseUser.value?.photoURL ?? '').image,
                ),
                Text(
                  authController.firebaseUser.value?.displayName ?? '',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'B.Tech(Computer Science)',
                  style: TextStyle(
                    fontFamily: 'Source Sans Pro',
                    color: Colors.teal.shade100,
                    fontSize: 20.0,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal,
                      ),
                      title: Text(
                        '+91 7355919089',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0,
                        ),
                      ),
                    )),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal,
                      ),
                      title: Text(
                        authController.firebaseUser.value?.email ?? '',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.teal.shade900,
                            fontFamily: 'Source Sans Pro'),
                      ),
                    )),
                SizedBox(width: 20,),
                RaisedButton(
                  onPressed: () {
                    authController.signOut();
                    googleSign.signOut();
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(20.0),
                    child: const Text('Log Out'),
                  ),
                ),
                // GestureDetector(
                //   onTap: ()async{
                //     authController.signOut();
                //     googleSign.signOut();
                //   },
                //   child: Text("Log Out",
                //     style: Get.textTheme.bodyText1,
                //   ),
                // ),
              ],
            )),
      ),
    );
  }
}