import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String title;
  final String description;
  final String place;
  Timestamp? timestamp;
  final String type;
  final String organiser;

  EventModel({
    required this.type,
    required this.title,
    required this.description,
    required this.place,
    required this.organiser,
  });


  //! We're gonna have to format the date of event to work with firestore

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'place': place, //todo: either get place from dropdown or from input
      'timestamp': Timestamp.now(), //todo: format date from input
      'type': type,  //todo: get type from dropdown
      'organiser': organiser,
    };
  }
}
