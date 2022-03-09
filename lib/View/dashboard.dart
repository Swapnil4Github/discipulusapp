import 'dart:ui';
import 'package:discipulus/Model/colors.dart';
import 'package:discipulus/View/profilePage.dart';
import 'package:discipulus/View/userDetailsAdd.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:discipulus/Model/categoryModel.dart';
import 'package:discipulus/Model/notesSubject.dart';
import 'package:discipulus/Model/notesData.dart';
import 'package:discipulus/Model/bottom_menu.dart';
import 'package:get/get.dart';
import 'package:discipulus/View/homeSlider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:discipulus/Model/constants.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNotification = false;

  PageController controller = PageController();
  @override
  void initState() {
    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
  }

  PageController pageController = PageController();
  int selectIndex = 0;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        child: ClipRect(
          child: BackdropFilter(
            filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: FloatingNavbar(
              selectedBackgroundColor: Colors.deepPurple,
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.transparent,
              onTap: (int val){
                setState(() {
                  _index = val;
                });
              },

              currentIndex: _index,
              items: [
                FloatingNavbarItem(icon: Icons.home_rounded,title: 'Home'),
                FloatingNavbarItem(icon: Icons.menu_book_rounded,title: 'Notes'),
                FloatingNavbarItem(icon: Icons.chat,title: 'Chat'),
                FloatingNavbarItem(icon: Icons.school_rounded,title: 'Jobs'),
                FloatingNavbarItem(icon: Icons.event_note_outlined,title: 'Events'),


              ],
            ),
          ),
        ),
      ),

      // bottomNavigationBar: BottomAppBar(
      //   elevation: 0,
      //   child: Container(
      //     // decoration: BoxDecoration(
      //     //     image: DecorationImage(
      //     //       image: AssetImage("assets/images/navbackground.jpg"),
      //     //       fit: BoxFit.fill,
      //     //     )
      //     // ),
      //     height: 60.0,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         for (int i = 0; bottomMenu.length > i; i++)
      //           GestureDetector(
      //             onTap: () {
      //               setState(() {
      //                 pageController.jumpToPage(i);
      //                 selectIndex = i;
      //               });
      //             },
      //             child: Container(
      //               width: 30,
      //               height: 30,
      //               child: Image.asset(bottomMenu[i].imagePath,
      //                 // color: grey.withOpacity(0.5),
      //                 // color: selectIndex == i ? green : grey.withOpacity(0.5),
      //               ),
      //             ),
      //           )
      //       ],
      //     ),
      //   ),
      // )
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: TextButton(
            onPressed: () {
              Get.to(UserDetailsAdd());
            },
            child: Container(
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
                child: Icon(Icons.notes_outlined,color: Colors.grey.shade700,)),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(UserDetailsAdd());
            }
            ,
            child: Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
              child: Icon(Icons.notifications_none_outlined,color: Colors.grey.shade800,),
            ),
          ),
          GestureDetector(
            onTap: (){Get.to(ProfilePage());},
            child: Container(
              height: 40.0,
              width: 40.0,
              margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,

                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: Image.network(authController.firebaseUser.value?.photoURL ?? '').image,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding:
                //   const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                //   child: SafeArea(
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Container(
                //             height: 45.0,
                //             width: 300.0,
                //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //             decoration: BoxDecoration(
                //               color: white,
                //               border: Border.all(color: green),
                //               boxShadow: [
                //                 BoxShadow(
                //                   color: green.withOpacity(0.15),
                //                   blurRadius: 10,
                //                   offset: const Offset(0, 0),
                //                 ),
                //               ],
                //               borderRadius: BorderRadius.circular(10.0),
                //             ),
                //             child: Row(
                //               children: [
                //                 const SizedBox(
                //                   height: 45,
                //                   width: 310,
                //                   child: TextField(
                //                     decoration: InputDecoration(
                //                       border: InputBorder.none,
                //                       hintText: 'Search',
                //                     ),
                //                   ),
                //                 ),
                //                 Image.asset(
                //                   'assets/icons/search.png',
                //                   height: 25,
                //                 )
                //               ],
                //             ),
                //           ),
                //         ),
                //         // Container(
                //         //   height: 45.0,
                //         //   width: 44.0,
                //         //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         //   decoration: BoxDecoration(
                //         //     color: green,
                //         //     boxShadow: [
                //         //       BoxShadow(
                //         //         color: green.withOpacity(0.5),
                //         //         blurRadius: 10,
                //         //         offset: const Offset(0, 0),
                //         //       ),
                //         //     ],
                //         //     borderRadius: BorderRadius.circular(10.0),
                //         //   ),
                //         //   child: Image.asset(
                //         //     'assets/icons/adjust.png',
                //         //     color: white,
                //         //     height: 25,
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),
                HomeSlider(),
                // SizedBox(
                //   height: 199,
                //   child: ListView.builder(
                //     controller: controller,
                //     physics: const BouncingScrollPhysics(),
                //     scrollDirection: Axis.horizontal,
                //     padding: EdgeInsets.only(left: 16,right: 6),
                //     itemCount: plants.length,
                //
                //     itemBuilder: (context,index){
                //       return AnimatedContainer(
                //           duration: const Duration(milliseconds: 500),
                //           curve: Curves.bounceInOut,
                //         margin: EdgeInsets.only(right:10),
                //         height: 199,
                //         width:300,
                //
                //         decoration :BoxDecoration(
                //           borderRadius:BorderRadius.circular(28),
                //       color : Colors.deepPurple,
                //       )
                //       );
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 250.0,
                //   width: 400.0,
                //   child: PageView.builder(
                //     itemCount: plants.length,
                //     controller: controller,
                //     physics: const BouncingScrollPhysics(),
                //     padEnds: false,
                //     pageSnapping: true,
                //     onPageChanged: (value) => setState(() => activePage = value),
                //     itemBuilder: (itemBuilder, index) {
                //       bool active = index == activePage;
                //       return slider(active, index);
                //     },
                //   ),
                // ),
                // SizedBox(
                //   height: 35.0,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       for (int i = 0; i < categories.length; i++)
                //         GestureDetector(
                //           onTap: () {
                //             setState(() => selectId = categories[i].id);
                //           },
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 categories[i].name,
                //                 style: TextStyle(
                //                   color: selectId == i
                //                       ? green
                //                       : black.withOpacity(0.7),
                //                   fontSize: 16.0,
                //                 ),
                //               ),
                //               if (selectId == i)
                //                 const CircleAvatar(
                //                   radius: 3,
                //                   backgroundColor: green,
                //                 )
                //             ],
                //           ),
                //         )
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Text(
                //         'Popular',
                //         style: TextStyle(
                //           color: black.withOpacity(0.7),
                //           fontWeight: FontWeight.bold,
                //           fontSize: 18.0,
                //         ),
                //       ),
                //       Image.asset(
                //         'assets/icons/more.png',
                //         color: green,
                //         height: 20,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 130.0,
                  child: ListView.builder(
                    itemCount: populerPlants.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      return Container(
                        width: 200.0,
                        margin: const EdgeInsets.only(right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  populerPlants[index].imagePath,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      populerPlants[index].name,
                                      style: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                      style: TextStyle(
                                        color: black.withOpacity(0.4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              right: 20,
                              bottom: 20,
                              child: CircleAvatar(
                                backgroundColor: green,
                                radius: 15,
                                child: Image.asset(
                                  'assets/icons/add.png',
                                  color: white,
                                  height: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 130.0,
                  child: ListView.builder(
                    itemCount: populerPlants.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      return Container(
                        width: 200.0,
                        margin: const EdgeInsets.only(right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  populerPlants[index].imagePath,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      populerPlants[index].name,
                                      style: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                      style: TextStyle(
                                        color: black.withOpacity(0.4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              right: 20,
                              bottom: 20,
                              child: CircleAvatar(
                                backgroundColor: green,
                                radius: 15,
                                child: Image.asset(
                                  'assets/icons/add.png',
                                  color: white,
                                  height: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 130.0,
                  child: ListView.builder(
                    itemCount: populerPlants.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      return Container(
                        width: 200.0,
                        margin: const EdgeInsets.only(right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  populerPlants[index].imagePath,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      populerPlants[index].name,
                                      style: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                      style: TextStyle(
                                        color: black.withOpacity(0.4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              right: 20,
                              bottom: 20,
                              child: CircleAvatar(
                                backgroundColor: green,
                                radius: 15,
                                child: Image.asset(
                                  'assets/icons/add.png',
                                  color: white,
                                  height: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30,),
                SizedBox(
                  height: 130.0,
                  child: ListView.builder(
                    itemCount: populerPlants.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      return Container(
                        width: 200.0,
                        margin: const EdgeInsets.only(right: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: lightGreen,
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  populerPlants[index].imagePath,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      populerPlants[index].name,
                                      style: TextStyle(
                                        color: black.withOpacity(0.7),
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Text(
                                      '\$${populerPlants[index].price.toStringAsFixed(0)}',
                                      style: TextStyle(
                                        color: black.withOpacity(0.4),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Positioned(
                              right: 20,
                              bottom: 20,
                              child: CircleAvatar(
                                backgroundColor: green,
                                radius: 15,
                                child: Image.asset(
                                  'assets/icons/add.png',
                                  color: white,
                                  height: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),



              ],
            ),
          ),
          // Positioned(
          //   bottom: 2,
          //   left: 0,
          //   right: 0,
          //   child: ClipRect(
          //     child: new BackdropFilter(
          //       filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          //       child: new Container(
          //         height: 60.0,
          //         decoration: new BoxDecoration(
          //             borderRadius: BorderRadius.circular(20.0),
          //             color: Colors.grey.shade200.withOpacity(0.5)),
          //         child: Container(),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  AnimatedContainer slider(active, index) {
    double margin = active ? 20 : 30;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index),
    );
  }

  Widget mainPlantsCard(index) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (builder) => DetailsPage(plant: plants[index]),
        //   ),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: lightGreen,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: AssetImage(plants[index].imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CircleAvatar(
                backgroundColor: green,
                radius: 15,
                child: Image.asset(
                  'assets/icons/add.png',
                  color: white,
                  height: 15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '${plants[index].name} - \$${plants[index].price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int selectId = 0;
  int activePage = 0;
}