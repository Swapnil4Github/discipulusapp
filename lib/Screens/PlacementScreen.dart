import 'package:cached_network_image/cached_network_image.dart';
import 'package:discipulus/Modules/Data.dart';
import 'package:discipulus/Modules/Event.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:discipulus/View/noteshome.dart';
import 'package:discipulus/Screens/EventHomeScreen.dart';
import 'package:discipulus/Screens/EventRegisterPage.dart';
import '../View/dashboard.dart';

class PlacementEventScreen extends StatefulWidget {
  final PlacementEvent event;

  const PlacementEventScreen({Key? key, required this.event}) : super(key: key);
  @override
  _PlacementEventScreen createState() => _PlacementEventScreen();
}

class _PlacementEventScreen extends State<PlacementEventScreen> {
  int _index = 4;

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
                  if(val==0)
                  {
                    Get.to(HomePage());
                  }
                  if(val==1)
                  {
                    Get.to(NotesHomePage());
                  }
                  if(val==4)
                  {
                    Get.to(EventHomeScreen());
                  }
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
      body: ListView(
        children: [

          Container(
            transform: Matrix4.translationValues(0, -25, 0),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child:  CachedNetworkImage(
                    imageUrl: widget.event.image,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,

                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 10,
                  left: 10,
                  top: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: KAppColor,
                        child: Text(
                          widget.event.date,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.event.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.music_note,
                            color: Colors.white,
                          ),
                          Text(
                            'Music',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 15,
                        ),
                        Text(
                          widget.event.location,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Text(
                      widget.event.fromTo,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.event.participants.toString() + ' Participants',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.event.duration.toString() + ' days duration',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                    color: KAppColor,
                    child: MaterialButton(
                      child: Text(
                        'REGISTER',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EventRegisterPage()
                          ),
                        );

                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.event.about,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
