import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discipulus/Modules/Data.dart';
import 'package:discipulus/Modules/Event.dart';
//import 'package:eventomepage/Screens/ProfileScreen.dart';
import 'package:discipulus/Widgets/HomeEventContainer.dart';
import 'package:flutter/material.dart';
import '../Controller/EventDataBaseService.dart';
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
import '../Widgets/HomePlacementEventContainer.dart';
import 'ChatHomeScreen.dart';
import 'EventHomeScreen.dart';
import 'PlacementHomeScreen.dart';



class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAtachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SizedBox(
            height: 144,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleImageSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Photo'),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _handleFileSelection();
                  },
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('File'),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      _addMessage(message);
    }
  }

  void _handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: _user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      _addMessage(message);
    }
  }

  void _handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void _handlePreviewDataFetched(
      types.TextMessage message,
      types.PreviewData previewData,
      ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = _messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() {
        _messages[index] = updatedMessage;
      });
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }
  int _index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if(val==2)
                  {
                    Get.to(ChatHomeScreen());
                  }
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
      body: SafeArea(
        bottom: true,
        child: Chat(
          messages: _messages,
          onAttachmentPressed: _handleAtachmentPressed,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          user: _user,
        ),
      ),
    );
  }
}