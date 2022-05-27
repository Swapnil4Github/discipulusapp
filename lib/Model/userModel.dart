import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? docId;
  String? name;
  String? emailAddress;
  String? gender;
  String? collegeName;
  String? degree;
  String? address;
  String? contactNumber;
  String? description;






  UserModel({this.docId, this.name, this.emailAddress,this.gender,this.collegeName,this.degree,this.address,this.contactNumber,this.description});

  UserModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    emailAddress = data["emailAddress"];
    gender = data["gender"];
    collegeName = data["collegeName"];
    degree = data["degree"];
    address = data["address"];
    contactNumber = data["contactNumber"];
    description = data["description"];

  }
}
