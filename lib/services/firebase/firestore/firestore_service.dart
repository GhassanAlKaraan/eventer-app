import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../models/event_model.dart';


class FirestoreService {

  /// Events Collection Reference
  final CollectionReference _events =
      FirebaseFirestore.instance.collection('events');

  /// CREATE
  Future<void> createEvent(EventModel event) async {
    return await _events
        .add(event.toMap())
        .then((value) => print("Event Added"))
        .catchError((_) {
      print("Could not add Event");
    });
  }

  ///UPDATE
  Future<void> updateEvent(String docId, EventModel event) async {
    return await _events
        .doc(docId)
        .update(event.toMap())
        .then((value) => print("Event Updated"))
        .catchError((_) {
      print("Could not update note");
    });
  }

  /// READ
  // Stream is used to listen to changes in the database.
  Stream<QuerySnapshot> getEventsStream() {
    return _events.orderBy('timestamp', descending: true).snapshots();
  }

  /// DELETE
  Future<void> deleteEvent(String docId) async {
    return await _events
        .doc(docId)
        .delete()
        .then((value) => print("Event Deleted"))
        .catchError((_) {
      print("Could not delete event");
    });
  }

  ///Get a single event
  Future<Map<String, dynamic>> getEventById(String docId) async {
    DocumentSnapshot ds = await _events.doc(docId).get();
    final Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
    return map;
  }

}
