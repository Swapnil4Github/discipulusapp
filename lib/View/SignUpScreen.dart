import 'package:discipulus/Model/constants.dart';

import 'package:flutter/material.dart';
import 'package:discipulus/main.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:discipulus/View/userDetailsAdd.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'dashboard.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isMale = true;
  // final controller = Get.put(LoginController());
  bool isSignupScreen = true;

  bool isRememberMe = false;
  var emailController3 = TextEditingController();
  var passwordController3 = TextEditingController();
  @override

  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: 'Sign in failed');
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: 'Sign in cancelled');
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: 'Sign in successful');
        break;
      default:
        break;
    }
    if(isMale==true){
      genderController2.text='Male';
    }else
      {
        genderController2.text='Female';
      }
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Palette.backgroundColor,
      body:Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 400,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/purple.jpg"),
                //       fit: BoxFit.fill,
                //     )
                // ),
                decoration:BoxDecoration(

                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.shade700,Colors.redAccent.shade700,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  // borderRadius: BorderRadius.circular(50),
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0,1),
                  ),
                  ],

                ),

                child: Container(
                    child: Column(
                      children: [
                        SizedBox(height: topPadding),
                        SizedBox(height: 5),
                        AnimatedImage(),
                      ],
                    )

                ),
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              top: isSignupScreen ? 600 : 530,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                    height: 90,
                    width: 90,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0,1),
                      ),
                      ],
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Colors.orange.shade200,Colors.red.shade400,
                            Colors.purpleAccent,Colors.lightBlue,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0,1),
                        ),
                        ],
                      ),
                    ),
                  ),

              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              top: isSignupScreen ? 270: 300,
              child:AnimatedContainer(
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
                height: isSignupScreen ? 380: 280,
                width: MediaQuery.of(context).size.width-40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5,
                      )
                    ]
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap:(){
                              setState((){
                                isSignupScreen = false;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  "LOGIN",
                                  style:
                                  TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? Colors.grey : Colors.black,),
                                ),
                                if (!isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.deepPurpleAccent,
                                  )

                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                isSignupScreen = true;
                              });
                            },
                            child: Column(
                              children: [
                                Text("SIGNUP",
                                  style:TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen ? Colors.black : Colors.grey,
                                  ),),
                                if(isSignupScreen)
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    height: 2,
                                    width: 55,
                                    color: Colors.deepPurple,
                                  )

                              ],
                            ),
                          ),

                        ],
                      ),
                      if(isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 13,right: 13),
                          child: Column(
                            children: [
                              Padding(
                                padding:const EdgeInsets.only(bottom:8.0),
                                child: TextField(
                                  controller: nameController2,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.account_box_outlined,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),

                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "User Name",
                                      hintStyle: TextStyle(
                                          fontSize: 14,color: Colors.grey),
                                    )
                                ),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(bottom:8.0),
                                child: TextField(
                                  controller: emailController2,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),

                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          fontSize: 14,color: Colors.grey),
                                    )
                                ),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(bottom:8.0),
                                child: TextField(
                                  controller: passwordController2,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),

                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          fontSize: 14,color: Colors.grey),
                                    )
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 10,left: 10),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          isMale = true;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.only(right: 8),

                                            decoration: BoxDecoration(
                                              color: isMale ? Colors.grey:Colors.transparent ,
                                              border:Border.all(
                                                width: 1,
                                                color: isMale ? Colors.transparent:Colors.grey ,

                                              ),
                                              borderRadius: BorderRadius.circular(15),

                                            ),
                                            child: Icon(Icons.male_outlined,
                                              color: isMale ? Colors.white:Colors.deepPurpleAccent ,),

                                          ),
                                          Text(
                                            "Male",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 30,),
                                    GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          isMale = false;
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 30,
                                            height: 30,
                                            margin: EdgeInsets.only(right: 8),
                                            decoration: BoxDecoration(
                                              color: isMale ? Colors.transparent:Colors.grey,
                                              border:Border.all(
                                                width: 1,
                                                color: isMale ? Colors.grey:Colors.transparent ,

                                              ),
                                              borderRadius: BorderRadius.circular(15),

                                            ),
                                            child: Icon(Icons.female_rounded,
                                              color: isMale ? Colors.deepPurpleAccent:Colors.white,),

                                          ),
                                          Text(
                                            "Female",
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                margin: EdgeInsets.only(top: 20),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: "By pressing 'Submit' you agree to our ",
                                      style: TextStyle(color: Colors.grey),
                                      children: [
                                        TextSpan(
                                          text: "terms & conditions",
                                          style: TextStyle(
                                            color: Colors.deepPurpleAccent,
                                          ),
                                        )
                                      ]
                                  ),
                                ),
                              ),



                            ],
                          ),

                        ),
                      if(!isSignupScreen)
                        Container(
                          margin: EdgeInsets.only(top: 20,left: 13,right: 13),
                          child: Column(
                            children: [
                              Padding(
                                padding:const EdgeInsets.only(bottom:8.0),
                                child: TextField(
                                  controller: emailController3,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.email_outlined,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),

                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                          fontSize: 14,color: Colors.grey),
                                    )
                                ),
                              ),
                              Padding(
                                padding:const EdgeInsets.only(bottom:8.0),
                                child: TextField(
                                  controller:passwordController3,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(35.0)),

                                      ),
                                      contentPadding: EdgeInsets.all(10),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          fontSize: 14,color: Colors.grey),
                                    )
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: isRememberMe,
                                        activeColor: Colors.grey,
                                        onChanged:(value){
                                          isRememberMe = !isRememberMe;
                                        },
                                      ),
                                      Text("Remeber me",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),)
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: (){

                                    },
                                    child: Text("Forgot Password?",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),),
                                  )
                                ],
                              )


                            ],
                          ),

                        )

                    ],
                  ),
                ),
              ) ,
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
              top: isSignupScreen ? 600 : 530,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 90,
                  width: 90,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: GestureDetector(
                    onTap: () {

                  },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            // Colors.orange.shade200,Colors.red.shade400,
                            Colors.purpleAccent,Colors.lightBlue,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: GestureDetector(
                           onTap: () async {
                             if(isSignupScreen==true)
                             {
                               authController.register(emailController2.text.trim(),
                                   passwordController2.text.trim());
                             }
                             else
                             {
                               authController.login(emailController3.text.trim(),
                                   passwordController3.text.trim());
                             }
                             if (authController.firebaseUser!=null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward,color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height-95,
              right: 0,
              left: 0,
              child: Column(
                children: [

                  Container(
                      margin:EdgeInsets.only(top: 11),
                      child: Text(isSignupScreen?"Or Signup with":"Or Signin with")),
                  Container(
                    margin: EdgeInsets.only(right: 20,left: 20,top: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        // TextButton(
                        //   onPressed: () async {
                        //   },
                        //   style: TextButton.styleFrom(
                        //     side: BorderSide(width: 1,color: Colors.grey),
                        //     minimumSize: Size(155,40),
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     primary: Colors.white,
                        //     backgroundColor: Palette.facebookColor,
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.facebook,
                        //       ),
                        //       SizedBox(
                        //         width: 5,
                        //       ),
                        //       Text("Facebook",),
                        //     ],
                        //   ),
                        // ),
                        TextButton(
                          onPressed: () async {
                            authController.signInWithGoogle();
                            bool isSuccess = await authProvider.handleGoogleSignIn();
                            if (isSuccess) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            }

                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(width: 1,color: Colors.grey),
                            minimumSize: Size(155,40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            primary: Colors.white,
                            backgroundColor: Palette.googleColor,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.googlePlus,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Google",),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),

          ],
        ),




    );
  }
}


class AnimatedImage extends StatefulWidget {
  const AnimatedImage({Key? key}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}


class _AnimatedImageState extends State<AnimatedImage>
  with SingleTickerProviderStateMixin{
    late final AnimationController _controller = AnimationController(vsync:this,
    duration:const Duration(seconds: 3),)..repeat(reverse: true);
    late Animation<Offset> _animation = Tween(
      begin: Offset(0,-0.08),
      end: Offset(0,0.08),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    @override
   void dispose(){
      super.dispose();
      _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset('assets/images/clouds.png',
        scale:1.37,),
    SlideTransition(position: _animation,
    child: Image.asset('assets/images/rocket_person.png',
    scale: 1.2,),
    )
      ],

    );
  }
}
// import 'package:discipulus/View/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:discipulus/allConstants/all_constants.dart';
// import 'package:discipulus/providers/auth_provider.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);
//
//     switch (authProvider.status) {
//       case Status.authenticateError:
//         Fluttertoast.showToast(msg: 'Sign in failed');
//         break;
//       case Status.authenticateCanceled:
//         Fluttertoast.showToast(msg: 'Sign in cancelled');
//         break;
//       case Status.authenticated:
//         Fluttertoast.showToast(msg: 'Sign in successful');
//         break;
//       default:
//         break;
//     }
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           ListView(
//             shrinkWrap: true,
//             padding: const EdgeInsets.symmetric(
//               vertical: Sizes.dimen_30,
//               horizontal: Sizes.dimen_20,
//             ),
//             children: [
//               vertical50,
//               const Text(
//                 'Welcome to Smart Talk',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: Sizes.dimen_26,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               vertical30,
//               const Text(
//                 'Login to continue',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: Sizes.dimen_22,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               vertical50,
//               Center(child: Image.asset('assets/images/back.png')),
//               vertical50,
//               GestureDetector(
//                 onTap: () async {
//                   bool isSuccess = await authProvider.handleGoogleSignIn();
//                   if (isSuccess) {
//                     Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const HomePage()));
//                   }
//                 },
//                 child: Image.asset('assets/images/google_login.jpg'),
//               ),
//             ],
//           ),
//           Center(
//             child: authProvider.status == Status.authenticating
//                 ? const CircularProgressIndicator(
//               color: AppColors.lightGrey,
//             )
//                 : const SizedBox.shrink(),
//           ),
//         ],
//       ),
//     );
//   }
// }
