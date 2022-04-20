import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:discipulus/View/customFullScreenDialog.dart';
import 'package:discipulus/View/customSnackBar.dart';
import 'package:get/get.dart';
import 'package:discipulus/Model/eventUserModel.dart';


  class EventRegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController NameController, RegController,CourseController,EmailController,ContactNumberController,EventName;
  // Firestore operation
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference collectionReference;

  RxList<EventUserModel> users = RxList<EventUserModel>([]);

  @override
  void onInit() {
  super.onInit();
  NameController = TextEditingController();
  RegController = TextEditingController();
  CourseController = TextEditingController();
  EmailController = TextEditingController();
  ContactNumberController = TextEditingController();
  EventName = TextEditingController();

  collectionReference = firebaseFirestore.collection("eventRegister");
  users.bindStream(getAllEmployees());
  }
  String? validateName(String value) {
  if (value.isEmpty) {
  return "Name can not be empty";
  }
  return null;
  }
  String? validateReg(String value) {
  if (value.isEmpty) {
  return "Name can not be empty";
  }
  return null;
  }
  String? validateCourse(String value) {
  if (value.isEmpty) {
  return "Name can not be empty";
  }
  return null;
  }
  String? validateEmail(String value) {
  if (value.isEmpty) {
  return "Name can not be empty";
  }
  return null;
  }
  String? validateContactNumber(String value) {
  if (value.isEmpty) {
  return "degree can not be empty";
  }
  return null;
  }
  String? validateEventName(String value) {
  if (value.isEmpty) {
  return "degree can not be empty";
  }
  return null;
  }
  void saveUpdateEmployee(
  String name, String reg,String course,String email,String contactnumber,String eventname, String docId, int addEditFlag) {
  // final isValid = formKey.currentState!.validate();
  // if (!isValid) {
  //   return;
  // }
  // formKey.currentState!.save();
  if (addEditFlag == 1) {
  CustomFullScreenDialog.showDialog();
  collectionReference
      .add({'name': name, 'reg': reg,'course':course,'email':email,'contactnumber':contactnumber,'eventname':eventname}).whenComplete(() {
  CustomFullScreenDialog.cancelDialog();
  clearEditingControllers();
  Get.back();
  CustomSnackBar.showSnackBar(
  context: Get.context,
  title: "Registration Form Submitted",
  message: "We will get back to you Soon !!",
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
      .update({'name': name, 'reg': reg,'course':course,'email':email,'contactnumber':contactnumber, 'eventname':eventname}).whenComplete(() {
  CustomFullScreenDialog.cancelDialog();
  clearEditingControllers();
  Get.back();
  CustomSnackBar.showSnackBar(
  context: Get.context,
  title: "Registration",
  message: "Details submitted successfully",
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
    NameController.clear();
    RegController.clear();
    CourseController.clear();
    EmailController.clear();
    ContactNumberController.clear();
    EventName.clear();
  }

  Stream<List<EventUserModel>> getAllEmployees() =>
  collectionReference.snapshots().map((query) =>
  query.docs.map((item) => EventUserModel.fromMap(item)).toList());

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


