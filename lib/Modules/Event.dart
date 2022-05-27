import 'package:cloud_firestore/cloud_firestore.dart';
class PlacementEvent {
  final String? id;
  String name;
  String image;
  String date;
  String category;
  String location;
  String fromTo;
  int participants;
  String cost;
  int duration;
  String about;

  PlacementEvent({
    this.id,
    required this.name,
    required this.image,
    required this.date,
    required this.category,
    required this.location,
    required this.fromTo,
    required this.participants,
    required this.cost,
    required this.duration,
    required this.about,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'category': category,
      'location': location,
      'fromTo': fromTo,
      'participants': participants,
      'cost': cost,
      'duration': duration,
      'about': about,
    };
  }

  PlacementEvent.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        image = doc.data()!["image"],
        date = doc.data()!["date"],
        category = doc.data()!["category"],
        location = doc.data()!["location"],
        fromTo = doc.data()!["fromTo"],
        participants = doc.data()!["participants"],
        cost = doc.data()!["cost"],
        duration = doc.data()!["duration"],
        about = doc.data()!["about"];
}

class Event {
  final String? id;
  String name;
  String image;
  String date;
  String category;
  String location;
  String fromTo;
  int participants;
  String cost;
  int duration;
  String about;

  Event({
    this.id,
    required this.name,
    required this.image,
    required this.date,
    required this.category,
    required this.location,
    required this.fromTo,
    required this.participants,
    required this.cost,
    required this.duration,
    required this.about,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'category': category,
      'location': location,
      'fromTo': fromTo,
      'participants': participants,
      'cost': cost,
      'duration': duration,
      'about': about,
    };
  }

  Event.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : id = doc.id,
        name = doc.data()!["name"],
        image = doc.data()!["image"],
        date = doc.data()!["date"],
        category = doc.data()!["category"],
        location = doc.data()!["location"],
        fromTo = doc.data()!["fromTo"],
        participants = doc.data()!["participants"],
        cost = doc.data()!["cost"],
        duration = doc.data()!["duration"],
        about = doc.data()!["about"];
}
