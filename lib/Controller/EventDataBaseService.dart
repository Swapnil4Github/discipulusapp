import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:discipulus/Modules/Event.dart';
class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<List<Event>> retrieveEvent() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("Event").get();
    return snapshot.docs
        .map((docSnapshot) => Event.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
  Future<List<Event>> retrieveUpcomingEvent() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("UpcomingEvent").get();
    return snapshot.docs
        .map((docSnapshot) => Event.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
  Future<List<PlacementEvent>> retrievePlacementEvent() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("PlacementEvent").get();
    return snapshot.docs
        .map((docSnapshot) => PlacementEvent.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
  Future<List<PlacementEvent>> retrieveUpcomingPlacementEvent() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await _db.collection("UpcomingPlacementEvent").get();
    return snapshot.docs
        .map((docSnapshot) => PlacementEvent.fromDocumentSnapshot(docSnapshot))
        .toList();
  }
}