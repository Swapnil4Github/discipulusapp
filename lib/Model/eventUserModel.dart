import 'package:cloud_firestore/cloud_firestore.dart';
class EventUserModel {
  String? docId;
  String? name;
  String? reg;
  String? course;
  String? email;
  String? contactnumber;
  String? eventname;







  EventUserModel({this.docId, this.name, this.reg,this.course,this.email,this.contactnumber,this.eventname});

  EventUserModel.fromMap(DocumentSnapshot data) {
    docId = data.id;
    name = data["name"];
    reg = data["reg"];
    course = data["course"];
    email = data["email"];
    contactnumber = data["contactnumber"];
    eventname = data["eventname"];
  }
}
