// import 'dart:convert';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:mime/mime.dart';
// import 'package:open_file/open_file.dart';
// import 'package:uuid/uuid.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:discipulus/Modules/Data.dart';
// import 'package:discipulus/Modules/Event.dart';
// //import 'package:eventomepage/Screens/ProfileScreen.dart';
// import 'package:discipulus/Widgets/HomeEventContainer.dart';
// import 'package:flutter/material.dart';
// import '../Controller/EventDataBaseService.dart';
// import '../View/dashboard.dart';
// import 'package:discipulus/Modules/Data.dart';
// import 'package:discipulus/Modules/Event.dart';
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:discipulus/Model/colors.dart';
// import 'package:discipulus/View/profilePage.dart';
// import 'package:discipulus/View/userDetailsAdd.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
// import 'package:discipulus/Model/constants.dart';
// import 'package:discipulus/View/noteshome.dart';
//
// import '../View/dashboard.dart';
// import '../Widgets/HomePlacementEventContainer.dart';
// import 'ChatHomeScreen.dart';
// import 'EventHomeScreen.dart';
// import 'PlacementHomeScreen.dart';
//
//
//
// class ChatHomeScreen extends StatefulWidget {
//   const ChatHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatHomeScreen> createState() => _ChatHomeScreenState();
// }
//
// class _ChatHomeScreenState extends State<ChatHomeScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//
//       home: ChatPage(),
//     );
//   }
// }
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);
//
//   @override
//   _ChatPageState createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   List<types.Message> _messages = [];
//   final _user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');
//
//   @override
//   void initState() {
//     super.initState();
//     _loadMessages();
//   }
//
//   void _addMessage(types.Message message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }
//
//   void _handleAtachmentPressed() {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: SizedBox(
//             height: 144,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     _handleImageSelection();
//                   },
//                   child: const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('Photo'),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     _handleFileSelection();
//                   },
//                   child: const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('File'),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text('Cancel'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   void _handleFileSelection() async {
//     final result = await FilePicker.platform.pickFiles(
//       type: FileType.any,
//     );
//
//     if (result != null && result.files.single.path != null) {
//       final message = types.FileMessage(
//         author: _user,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         id: const Uuid().v4(),
//         mimeType: lookupMimeType(result.files.single.path!),
//         name: result.files.single.name,
//         size: result.files.single.size,
//         uri: result.files.single.path!,
//       );
//
//       _addMessage(message);
//     }
//   }
//
//   void _handleImageSelection() async {
//     final result = await ImagePicker().pickImage(
//       imageQuality: 70,
//       maxWidth: 1440,
//       source: ImageSource.gallery,
//     );
//
//     if (result != null) {
//       final bytes = await result.readAsBytes();
//       final image = await decodeImageFromList(bytes);
//
//       final message = types.ImageMessage(
//         author: _user,
//         createdAt: DateTime.now().millisecondsSinceEpoch,
//         height: image.height.toDouble(),
//         id: const Uuid().v4(),
//         name: result.name,
//         size: bytes.length,
//         uri: result.path,
//         width: image.width.toDouble(),
//       );
//
//       _addMessage(message);
//     }
//   }
//
//   void _handleMessageTap(BuildContext context, types.Message message) async {
//     if (message is types.FileMessage) {
//       await OpenFile.open(message.uri);
//     }
//   }
//
//   void _handlePreviewDataFetched(
//       types.TextMessage message,
//       types.PreviewData previewData,
//       ) {
//     final index = _messages.indexWhere((element) => element.id == message.id);
//     final updatedMessage = _messages[index].copyWith(previewData: previewData);
//
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       setState(() {
//         _messages[index] = updatedMessage;
//       });
//     });
//   }
//
//   void _handleSendPressed(types.PartialText message) {
//     final textMessage = types.TextMessage(
//       author: _user,
//       createdAt: DateTime.now().millisecondsSinceEpoch,
//       id: const Uuid().v4(),
//       text: message.text,
//     );
//
//     _addMessage(textMessage);
//   }
//
//   void _loadMessages() async {
//     final response = await rootBundle.loadString('assets/messages.json');
//     final messages = (jsonDecode(response) as List)
//         .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
//         .toList();
//
//     setState(() {
//       _messages = messages;
//     });
//   }
//   int _index = 2;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: Container(
//         height: 80,
//         child: ClipRect(
//           child: BackdropFilter(
//             filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//             child: FloatingNavbar(
//               selectedBackgroundColor: Colors.deepPurple,
//               unselectedItemColor: Colors.black,
//               selectedItemColor: Colors.white,
//               backgroundColor: Colors.transparent,
//               onTap: (int val){
//                 setState(() {
//                   if(val==2)
//                   {
//                     Get.to(ChatHomeScreen());
//                   }
//                   if(val==4)
//                   {
//                     Get.to(EventHomeScreen());
//                   }
//                   if(val==1)
//                   {
//                     Get.to(() => NotesHomePage());
//                   }
//                   if(val==0)
//                   {
//                     Get.to(() => HomePage());
//                   }
//
//                   if(val==3)
//                   {
//                     Get.to(() => PlacementHomeScreen());
//                   }
//                   _index = val;
//                 });
//               },
//
//               currentIndex: _index,
//               items: [
//                 FloatingNavbarItem(icon: Icons.home_rounded,title: 'Home'),
//                 FloatingNavbarItem(icon: Icons.menu_book_rounded,title: 'Notes'),
//                 FloatingNavbarItem(icon: Icons.chat,title: 'Chat'),
//                 FloatingNavbarItem(icon: Icons.school_rounded,title: 'Jobs'),
//                 FloatingNavbarItem(icon: Icons.event_note_outlined,title: 'Events'),
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: white,
//         automaticallyImplyLeading: false,
//         leadingWidth: 60,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 8),
//           child: TextButton(
//             onPressed: () {
//               Get.to(UserDetailsAdd());
//             },
//             child: Container(
//                 width: 70,
//                 height: 35,
//                 decoration: BoxDecoration(
//                   color: white,
//                   border: Border.all(color: Colors.grey),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey,
//                       blurRadius: 2,
//                       offset: const Offset(0, 0),
//                     ),
//                   ],
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Icon(Icons.notes_outlined,color: Colors.grey.shade700,)),
//           ),
//         ),
//         actions: [
//           GestureDetector(
//             onTap: (){
//               Get.to(UserDetailsAdd());
//             }
//             ,
//             child: Container(
//               height: 40.0,
//               width: 40.0,
//               margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
//               child: Icon(Icons.edit,color: Colors.grey.shade800,),
//             ),
//           ),
//           GestureDetector(
//             onTap: (){Get.to(ProfilePage());},
//             child: Container(
//               height: 40.0,
//               width: 40.0,
//               margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
//               decoration: BoxDecoration(
//                 color: Colors.deepPurpleAccent,
//
//                 borderRadius: BorderRadius.circular(20.0),
//                 image: DecorationImage(
//                   image: Image.network(authController.firebaseUser.value?.photoURL ?? '').image,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SafeArea(
//         bottom: true,
//         child: Chat(
//           messages: _messages,
//           onAttachmentPressed: _handleAtachmentPressed,
//           onMessageTap: _handleMessageTap,
//           onPreviewDataFetched: _handlePreviewDataFetched,
//           onSendPressed: _handleSendPressed,
//           user: _user,
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discipulus/View/SignUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';

import '../Model/chat_user.dart';
import '../View/profilePage.dart';
import '../allConstants/color_constants.dart';
import '../allConstants/firestore_constants.dart';
import '../allConstants/size_constants.dart';
import '../allConstants/text_field_constants.dart';
import '../allWidgets/loading_view.dart';
import '../providers/auth_provider.dart';
import '../providers/home_provider.dart';
import '../utilities/debouncer.dart';
import '../utilities/keyboard_utils.dart';
import 'ChatPage.dart';

class ChatHomeScreen extends StatefulWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  State<ChatHomeScreen> createState() => _ChatHomeScreenState();
}

class _ChatHomeScreenState extends State<ChatHomeScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  final ScrollController scrollController = ScrollController();
  int _limit = 20;
  final int _limitIncrement = 20;
  String _textSearch = "";
  bool isLoading = false;
  late String currentUserId;
  late AuthProvider authProvider;
  late HomeProvider homeProvider;
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);
  StreamController<bool> buttonClearController = StreamController<bool>();
  TextEditingController searchTextEditingController = TextEditingController();
  Future<void> googleSignOut() async {
    authProvider.googleSignOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) =>  SignUpScreen()));
  }

  Future<bool> onBackPress() {
    openDialog();
    return Future.value(false);
  }

  Future<void> openDialog() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return SimpleDialog(
            backgroundColor: AppColors.burgundy,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Exit Application',
                  style: TextStyle(color: AppColors.white),
                ),
                Icon(
                  Icons.exit_to_app,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.dimen_10),
            ),
            children: [
              vertical10,
              const Text(
                'Are you sure?',
                textAlign: TextAlign.center,
                style:
                TextStyle(color: AppColors.white, fontSize: Sizes.dimen_16),
              ),
              vertical15,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 0);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(Sizes.dimen_8),
                      ),
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: AppColors.spaceCadet),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        })) {
      case 0:
        break;
      case 1:
        exit(0);
    }
  }

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }


  @override
  void dispose() {
    super.dispose();
    buttonClearController.close();
  }
  @override
  void initState() {
    super.initState();
    authProvider = context.read<AuthProvider>();
    homeProvider = context.read<HomeProvider>();
    if (authProvider.getFirebaseUserId()?.isNotEmpty == true) {
      currentUserId = authProvider.getFirebaseUserId()!;
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>  SignUpScreen()),
              (Route<dynamic> route) => false);
    }

    scrollController.addListener(scrollListener);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text('Smart Talk'),
            actions: [
              IconButton(
                  onPressed: () => googleSignOut(),
                  icon: const Icon(Icons.logout)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ProfilePage()));
                  },
                  icon: const Icon(Icons.person)),
            ]),
        body: WillPopScope(
          onWillPop: onBackPress,
          child: Stack(
            children: [
              Column(
                children: [
                  buildSearchBar(),
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: homeProvider.getFirestoreData(
                          FirestoreConstants.pathUserCollection,
                          _limit,
                          _textSearch),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          if ((snapshot.data?.docs.length ?? 0) > 0) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) => buildItem(
                                  context, snapshot.data?.docs[index]),
                              controller: scrollController,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                              const Divider(),
                            );
                          } else {
                            return const Center(
                              child: Text('No user found...'),
                            );
                          }
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                child:
                isLoading ? const LoadingView() : const SizedBox.shrink(),
              ),
            ],
          ),
        ));
  }
  Widget buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(Sizes.dimen_10),
      height: Sizes.dimen_50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: Sizes.dimen_10,
          ),
          const Icon(
            Icons.person_search,
            color: AppColors.white,
            size: Sizes.dimen_24,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              textInputAction: TextInputAction.search,
              controller: searchTextEditingController,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  buttonClearController.add(true);
                  setState(() {
                    _textSearch = value;
                  });
                } else {
                  buttonClearController.add(false);
                  setState(() {
                    _textSearch = "";
                  });
                }
              },
              decoration: const InputDecoration.collapsed(
                hintText: 'Search here...',
                hintStyle: TextStyle(color: AppColors.white),
              ),
            ),
          ),
          StreamBuilder(
              stream: buttonClearController.stream,
              builder: (context, snapshot) {
                return snapshot.data == true
                    ? GestureDetector(
                  onTap: () {
                    searchTextEditingController.clear();
                    buttonClearController.add(false);
                    setState(() {
                      _textSearch = '';
                    });
                  },
                  child: const Icon(
                    Icons.clear_rounded,
                    color: AppColors.greyColor,
                    size: 20,
                  ),
                )
                    : const SizedBox.shrink();
              })
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_30),
        color: AppColors.spaceLight,
      ),
    );
  }

  Widget buildItem(BuildContext context, DocumentSnapshot? documentSnapshot) {
    final firebaseAuth = FirebaseAuth.instance;
    if (documentSnapshot != null) {
      ChatUser userChat = ChatUser.fromDocument(documentSnapshot);
      if (userChat.id == currentUserId) {
        return const SizedBox.shrink();
      } else {
        return TextButton(
          onPressed: () {
            if (KeyboardUtils.isKeyboardShowing()) {
              KeyboardUtils.closeKeyboard(context);
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChatPage(
                      peerId: userChat.id,
                      peerAvatar: userChat.photoUrl,
                      peerNickname: userChat.displayName,
                      userAvatar: firebaseAuth.currentUser!.photoURL!,
                    )));
          },
          child: ListTile(
            leading: userChat.photoUrl.isNotEmpty
                ? ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_30),
              child: Image.network(
                userChat.photoUrl,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
                loadingBuilder: (BuildContext ctx, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                          color: Colors.grey,
                          value: loadingProgress.expectedTotalBytes !=
                              null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null),
                    );
                  }
                },
                errorBuilder: (context, object, stackTrace) {
                  return const Icon(Icons.account_circle, size: 50);
                },
              ),
            )
                : const Icon(
              Icons.account_circle,
              size: 50,
            ),
            title: Text(
              userChat.displayName,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        );
      }
    } else {
      return const SizedBox.shrink();
    }
  }

}
