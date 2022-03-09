import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:discipulus/Controller/login_controller.dart';
import 'package:discipulus/Controller/user_controller.dart';

import 'Model/constants.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Get.lazyPut<UserController>(
          () => UserController(),
    );

  await firebaseInitialization.then((value) {
    Get.put(AuthController());

    runApp(MyApp());
  });
      }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: const CircularProgressIndicator(backgroundColor: Colors.white,)),
    );
  }
}


class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
 
}