import 'dart:ui';
import 'package:discipulus/Model/colors.dart';
import 'package:discipulus/View/profilePage.dart';
import 'package:discipulus/View/userDetailsAdd.dart';
import 'package:discipulus/Widgets/HomePlacementEventContainer.dart';
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
import 'package:discipulus/View/noteshome.dart';
import 'package:discipulus/Screens/EventHomeScreen.dart';

import '../Controller/EventDataBaseService.dart';
import '../Controller/user_controller.dart';
import '../Screens/ChatHomeScreen.dart';
import '../Screens/PlacementHomeScreen.dart';
import 'package:discipulus/Modules/Event.dart';

import '../Widgets/HomeEventContainer.dart';
import '../providers/auth_provider.dart';
import 'SignUpScreen.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNotification = false;

  PageController controller = PageController();
  DatabaseService service = DatabaseService();
  late AuthProvider authProvider;

  Future<List<Event>>? upcomingEventList;
  List<Event>? retrievedUpcomingEventList;
  Future<List<PlacementEvent>>? upcomingPlacementEventList;
  List<PlacementEvent>? retrievedUpcomingPlacementEventList;
  Future<void> _initRetrieval() async {
    upcomingEventList = service.retrieveUpcomingEvent();
    retrievedUpcomingEventList = await service.retrieveUpcomingEvent();
    upcomingPlacementEventList = service.retrieveUpcomingPlacementEvent();
    retrievedUpcomingPlacementEventList = await service.retrieveUpcomingPlacementEvent();
  }
  @override
  void initState() {

    controller = PageController(viewportFraction: 0.6, initialPage: 0);
    super.initState();
    _initRetrieval();

  }
  Future<void> googleSignOut() async {
    authProvider.googleSignOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  SignUpScreen()));
  }
  PageController pageController = PageController();
  int selectIndex = 0;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    _initRetrieval();

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        child: FloatingNavbar(
          selectedBackgroundColor: Colors.deepPurple,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.white,
          onTap: (int val){
            setState(() {
              if(val==4)
              {
                Get.to(EventHomeScreen());
              }
              if(val==2)
              {
                Get.to(ChatHomeScreen());
              }
              if(val==1)
              {
                Get.to(() => NotesHomePage());
              }
              if(val==0)
              {
                Get.to(() => HomePage());
              }

              if(val==3)
              {
                Get.to(() => PlacementHomeScreen());
              }
              _index = val;
            }
            );
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
              Get.lazyPut<UserController>(
                    () => UserController(),
              );
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
                child: Icon(Icons.edit,color: Colors.grey.shade700,)),
          ),
        ),
        actions: [

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
                HomeSlider(),
                FutureBuilder<List<Event>>(
                    future: upcomingEventList,
                    builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty)
                      {
                        _initRetrieval();
                        return SizedBox(
                          height: 300.0,
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Latest Event',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: 1,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          Event event = retrievedUpcomingEventList![index];
                                          return HomeEventContainer(
                                            event: event,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );

                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
                ),

              FutureBuilder<List<PlacementEvent>>(
                    future: upcomingPlacementEventList,
                    builder: (BuildContext context, AsyncSnapshot<List<PlacementEvent>> snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty)
                      {
                        _initRetrieval();

                        return SizedBox(
                          height: 300.0,
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Latest Placement Drive',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 300,
                                      child: ListView.builder(
                                        itemCount: 1,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          PlacementEvent event = retrievedUpcomingPlacementEventList![index];
                                          return HomePlacementEventContainer(
                                            event: event,
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );

                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }
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