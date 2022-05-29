import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discipulus/Modules/Data.dart';
import 'package:discipulus/Modules/Event.dart';
//import 'package:eventomepage/Screens/ProfileScreen.dart';
import 'package:discipulus/Widgets/HomeEventContainer.dart';
import 'package:flutter/material.dart';
import '../Controller/EventDataBaseService.dart';
import '../Controller/user_controller.dart';
import '../View/dashboard.dart';
import 'package:discipulus/Modules/Data.dart';
import 'package:discipulus/Modules/Event.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:discipulus/Model/colors.dart';
import 'package:discipulus/View/profilePage.dart';
import 'package:discipulus/View/userDetailsAdd.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:discipulus/Model/constants.dart';
import 'package:discipulus/View/noteshome.dart';

import '../View/dashboard.dart';
import 'ChatHomeScreen.dart';
import 'PlacementHomeScreen.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  int _index = 4;

  DatabaseService service = DatabaseService();
  Future<List<Event>>? eventList;
  List<Event>? retrievedEventList;
  Future<List<Event>>? upcomingEventList;
  List<Event>? retrievedUpcomingEventList;
  @override
  void initState() {
    super.initState();
    _initRetrieval();

  }
  Future<void> _initRetrieval() async {
    eventList = service.retrieveEvent();
    retrievedEventList = await service.retrieveEvent();
    upcomingEventList = service.retrieveUpcomingEvent();
    retrievedUpcomingEventList = await service.retrieveUpcomingEvent();
  }
  Widget build(BuildContext context) {
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
      body: FutureBuilder<List<Event>>(
        future: eventList,
          builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot) {
if (snapshot.hasData && snapshot.data!.isNotEmpty)
  {
    _initRetrieval();

    return ListView(
        children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'This Weekend',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 290,
                child: ListView.builder(
                  itemCount: retrievedEventList?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Event event = retrievedEventList![index];
                    return HomeEventContainer(
                      event: event,
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      'All',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 290,
                child: ListView.builder(
                  itemCount: retrievedUpcomingEventList?.length,
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
    );

  } else {
  return const Center(child: CircularProgressIndicator());
}
        }
      ),
    );
  }
}
