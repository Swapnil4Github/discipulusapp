import 'package:flutter/material.dart';
import 'package:discipulus/Controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:discipulus/Model/constants.dart';
import 'package:discipulus/View/dashboard.dart';
class UserDetailsAdd extends GetView<UserController> {
  const UserDetailsAdd({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    controller.emailAddressController=emailController2;
    controller.nameController=nameController2;
    controller.genderController=genderController2;

    return Scaffold(
      resizeToAvoidBottomInset : false,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


        Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
        ),
        color: Colors.white,
        ),
        child: Padding(
        padding:
        const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        child: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(
        'Add User',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
        height: 8,
        ),
        TextFormField(
        decoration: InputDecoration(
        hintText: 'Name',
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        ),
        ),
        controller: controller.nameController,
        validator: (value) {
        return controller.validateName(value!);
        },
        ),
        SizedBox(
        height: 10,
        ),
        TextFormField(
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
        hintText: 'Email Address',
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        ),
        ),
        controller: controller.emailAddressController,
        validator: (value) {
        return controller.validateAddress(value!);
        },
        ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Gender',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: controller.genderController,
            validator: (value) {
              return controller.validateAddress(value!);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'College Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: controller.collegeNameController,
            validator: (value) {
              return controller.validateAddress(value!);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Degree',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: controller.degreeController,
            validator: (value) {
              return controller.validateAddress(value!);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: controller.addressController,
            validator: (value) {
              return controller.validateAddress(value!);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: controller.contactNumberController,
            validator: (value) {
              return controller.validateAddress(value!);
            },
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'More Description',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: controller.descriptionController,
            validator: (value) {
              return controller.validateAddress(value!);
            },
          ),

        SizedBox(
        height: 8,
        ),
        ConstrainedBox(
        constraints: BoxConstraints.tightFor(
        width: Get.context!.width, height: 45),
        child: ElevatedButton(
        child: Text(
        'Add',
        style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        onPressed: () {
        controller.saveUpdateEmployee(
            controller.nameController.text,
                            controller.addressController.text,
                            controller.emailAddressController.text,
                            controller.genderController.text,
                            controller.collegeNameController.text,
                            controller.degreeController.text,
                            controller.contactNumberController.text,
                            controller.descriptionController.text,
                            '',
                            1);
        check=1 as RxInterface<int?>;
                        Get.to(HomePage());
        },
        ),
        ),
        ],
        ),
        ),
        ),
        ),
        ),



          //         Text('Submit all Details'),
      //         SizedBox(height: 20,),
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //
      //             controller: controller.nameController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.account_box_outlined,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "User Name",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.emailAddressController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.email_outlined,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "Email Address",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.genderController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.accessibility,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "Gender",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.collegeNameController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.school_outlined,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "College Name",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.degreeController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.menu_book,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "Degree Name",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.addressController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.home,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "Your Home Address",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.contactNumberController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.phone,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "Mobile Number",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      //         SizedBox(height: 10,),
      //
      //         Padding(
      //           padding: EdgeInsets.only(bottom:8.0),
      //           child: TextField(
      //             controller: controller.descriptionController,
      //               keyboardType: TextInputType.text,
      //               decoration: InputDecoration(
      //                 prefixIcon: Icon(
      //                   Icons.description_outlined,
      //                   color: Colors.deepPurpleAccent,
      //                 ),
      //                 enabledBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //                 ),
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color: Colors.grey),
      //                   borderRadius: BorderRadius.all(Radius.circular(35.0)),
      //
      //                 ),
      //                 contentPadding: EdgeInsets.all(10),
      //                 hintText: "More Description",
      //                 hintStyle: TextStyle(
      //                     fontSize: 14,color: Colors.grey),
      //               )
      //           ),
      //         ),
      // // String name, String address,String emailAddress,String gender,String collegeName,String degree,String contactNumber,String description, String docId, int addEditFlag) {
      //
      // SizedBox(height: 15,),
      //           ElevatedButton(onPressed: (){
      //             controller.saveUpdateEmployee(
      //                 controller.nameController.text,
      //                 controller.addressController.text,
      //                 controller.emailAddressController.text,
      //                 controller.genderController.text,
      //                 controller.collegeNameController.text,
      //                 controller.degreeController.text,
      //                 controller.contactNumberController.text,
      //                 controller.descriptionController.text,
      //                 '',
      //                 1);
      //             Get.to(HomePage());
      //
      //           }, child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
// _buildAddEditEmployeeVieweeView({String? text, int? addEditFlag, String? docId}) {
//   Get.bottomSheet(
//     Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(16),
//           topLeft: Radius.circular(16),
//         ),
//         color: Color(0xff1E2746),
//       ),
//       child: Padding(
//         padding:
//         const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
//         child: Form(
//           key: controller.formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${text} Employee',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     hintText: 'Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   controller: controller.nameController,
//                   validator: (value) {
//                     return controller.validateName(value!);
//                   },
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                     hintText: 'Address',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   controller: controller.addressController,
//                   validator: (value) {
//                     return controller.validateAddress(value!);
//                   },
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 ConstrainedBox(
//                   constraints: BoxConstraints.tightFor(
//                       width: Get.context!.width, height: 45),
//                   child: ElevatedButton(
//                     child: Text(
//                       text!,
//                       style: TextStyle(color: Colors.black, fontSize: 16),
//                     ),
//                     onPressed: () {
//                       controller.saveUpdateEmployee(
//                           controller.nameController.text,
//                           controller.addressController.text,
//                           docId!,
//                           addEditFlag!);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }
// displayDeleteDialog(SizedBoxtring docId) {
//   Get.defaultDialog(
//     title: "Delete Employee",
//     titleStyle: TextStyle(fontSize: 20),
//     middleText: 'Are you sure to delete employee ?',
//     textCancel: "Cancel",
//     textConfirm: "Confirm",
//     confirmTextColor: Colors.black,
//     onCancel: () {},
//     onConfirm: () {
//       controller.deleteData(docId);
//     },
//   );
// }

