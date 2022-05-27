import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:discipulus/View/customFullScreenDialog.dart';
import 'package:discipulus/View/customSnackBar.dart';
import 'package:discipulus/Model/userModel.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController, emailAddressController,genderController,collegeNameController,degreeController,addressController,contactNumberController,descriptionController;
  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<UserModel> users = RxList<UserModel>([]);

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    emailAddressController = TextEditingController();
    genderController = TextEditingController();
    collegeNameController = TextEditingController();
    degreeController = TextEditingController();
    addressController = TextEditingController();
    contactNumberController = TextEditingController();
    descriptionController = TextEditingController();
    collectionReference = firebaseFirestore.collection("users");
    users.bindStream(getAllEmployees());
  }
  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }
  String? validateEmailAddress(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }
  String? validateGender(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }
  String? validateCollegeName(String value) {
    if (value.isEmpty) {
      return "Name can not be empty";
    }
    return null;
  }
  String? validateDegree(String value) {
    if (value.isEmpty) {
      return "degree can not be empty";
    }
    return null;
  }
  String? validateContactNumber(String value) {
    if (value.isEmpty) {
      return "contactNumber can not be empty";
    }
    return null;
  }
  String? validateDescription(String value) {
    if (value.isEmpty) {
      return "description can not be empty";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Address can not be empty";
    }
    return null;
  }

  void saveUpdateEmployee(
      String name, String address,String emailAddress,String gender,String collegeName,String degree,String contactNumber,String description, String docId, int addEditFlag) {
    // final isValid = formKey.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }
    formKey.currentState!.save();
    if (addEditFlag == 1) {
      CustomFullScreenDialog.showDialog();
      collectionReference
          .add({'name': name, 'address': address,'emailAddress':emailAddress,'gender':gender,'collegeName':collegeName,'degree':degree,'contactNumber':contactNumber,'description':description}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "User Added",
            message: "User added successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.green);
      });
    } else if (addEditFlag == 2) {
      //update
      CustomFullScreenDialog.showDialog();
      collectionReference
          .doc(docId)
          .update({'name': name, 'address': address,emailAddress:'emailAddress',gender:'gender',collegeName:'collegeName',degree:'degree',contactNumber:'contactNumber',description:'description'}).whenComplete(() {
        CustomFullScreenDialog.cancelDialog();
        clearEditingControllers();
        Get.back();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "User Updated",
            message: "User updated successfully",
            backgroundColor: Colors.green);
      }).catchError((error) {
        CustomFullScreenDialog.cancelDialog();
        CustomSnackBar.showSnackBar(
            context: Get.context,
            title: "Error",
            message: "Something went wrong",
            backgroundColor: Colors.red);
      });
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {

  }

  void clearEditingControllers() {

  }

  Stream<List<UserModel>> getAllEmployees() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => UserModel.fromMap(item)).toList());

  void deleteData(String docId) {
    CustomFullScreenDialog.showDialog();
    collectionReference.doc(docId).delete().whenComplete(() {
      CustomFullScreenDialog.cancelDialog();
      Get.back();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "User Deleted",
          message: "User deleted successfully",
          backgroundColor: Colors.green);
    }).catchError((error) {
      CustomFullScreenDialog.cancelDialog();
      CustomSnackBar.showSnackBar(
          context: Get.context,
          title: "Error",
          message: "Something went wrong",
          backgroundColor: Colors.red);
    });
  }
}
