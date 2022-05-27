import 'package:discipulus/Screens/EventHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:discipulus/View/units.dart';
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
import 'package:discipulus/View/noteshome.dart';
import 'package:discipulus/View/dashboard.dart';

import '../Screens/ChatHomeScreen.dart';
import '../Screens/PlacementHomeScreen.dart';
void main() {

  runApp(Notes());
}

class Notes extends StatefulWidget {

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  //const Notes({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select Course ',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: NotesHomePage(),
    );
  }
}
class NotesHomePage extends StatefulWidget {
  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  //const MyHomePage({Key? key}) : super(key: key);
  int _index = 1;
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
                  if(val==4)
                  {
                    Get.to(EventHomeScreen());
                  }
                  if(val==1)
                  {
                    Get.to(() => NotesHomePage());
                  }
                  if(val==0)
                  {
                    Get.to(() => HomePage());
                  }
                  if(val==2)
                  {
                    Get.to(() => ChatHomeScreen());
                  }

                  if(val==3)
                  {
                    Get.to(() => PlacementHomeScreen());
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
      body:_buildListView(context) ,
    );
  }

  ListView _buildListView(BuildContext context){
    final List<String> Entries = <String>['CSE101','CSE202','CSE205','CSE211','CSE224','CSE304','CSE305','CSE306','CSE310','CSE316','CSE320','CSE322'];
    return ListView.builder(
      itemCount: Entries.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title:  Text(' ${Entries[index]}'),
            trailing: Icon(Icons.arrow_right_sharp),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Units('${Entries[index]}')));

            },

          );
        },
    );
  }
}

