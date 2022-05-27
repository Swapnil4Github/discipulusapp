import 'package:flutter/material.dart';
import 'package:discipulus/View/pdf_api.dart';
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
class Units extends StatefulWidget {
  var subject;

  Units(this.subject);

  @override
  State<Units> createState() => _UnitsState(subject);
}

class _UnitsState extends State<Units> {
  var subject;

  _UnitsState(this.subject);
  final List<String> entries = <String>['Syllabus','Unit 1', 'Unit 2', 'Unit 3','Unit 4','Unit 5','Unit 6'];
  int _navindex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if(val==1)
                  {
                    Get.to(NotesHomePage());
                  }
                  if(val==0)
                  {
                    Get.to(HomePage());
                  }
                  _navindex = val;
                });
              },

              currentIndex: _navindex,
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
              child: Icon(Icons.edit,color: Colors.grey.shade800,),
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
      body: _buildListView(context),
    );
  }

  ListView _buildListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title:  Text(' ${entries[index]}'),
          trailing: Icon(Icons.arrow_right_sharp),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PDF_api(subject)));

          },
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

  }
}
