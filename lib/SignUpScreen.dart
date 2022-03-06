import 'package:discipulus/authentication/viaEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:discipulus/main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import 'package:discipulus/Controller/login_controller.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isMale = true;
  final controller = Get.put(LoginController());
  bool isSignupScreen = true;

  bool isRememberMe = false;

  @override
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body:  Obx((){
        if(controller.auth.currentUser?.emailVerified==null)
          return Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/purple.jpg"),
                        fit: BoxFit.fill,
                      )

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
                            Colors.orange.shade200,Colors.red.shade400,
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
                                      controller: emailController,
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
                                      controller: passwordController,
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
                      onTap: ()
                      {

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange.shade200,Colors.red.shade400,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Icon(
                          Icons.arrow_forward,color: Colors.white,
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

                    Text(isSignupScreen?"Or Signup with":"Or Signin with"),
                    Container(
                      margin: EdgeInsets.only(right: 20,left: 20,top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          TextButton(
                            onPressed: () async {
                            },
                            style: TextButton.styleFrom(
                              side: BorderSide(width: 1,color: Colors.grey),
                              minimumSize: Size(155,40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              primary: Colors.white,
                              backgroundColor: Palette.facebookColor,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.facebook,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Facebook",),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              controller.login();

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
          );
        else
          return Center(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: Image.network(controller.googleAccount.value?.photoUrl ?? '').image,
                    radius: 100,
                  ),
                  Text(controller.googleAccount.value?.displayName ?? '',
                  style: Get.textTheme.headline1,),
                  Text(controller.googleAccount.value?.email ?? '',
                    style: Get.textTheme.bodyText1),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.logout();
                    },
                    child: Text("Log Out",
                      style: Get.textTheme.headline1,
                    ),
                  ),

                ],

              ),
            ),
          );
      })

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
