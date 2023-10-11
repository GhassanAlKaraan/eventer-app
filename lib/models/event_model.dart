import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  final String title;
  final String description;
  final String place;
  Timestamp? timestamp;
  final String type;

  EventModel({ required this.type,
    required this.title,
    required this.description,
    required this.place,
  });


  ///Caution: we're gonna have to format the date of event to work with firestore

  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'description': description,
  //     'place': place,
  //     'timestamp': timestamp,
  //     'type': type,
  //   };
  // }

Map<String, dynamic> toMap() {
  return {
    'title': title, ///check.
    'description': description, ///check.
    'place': place, //todo: either get place from dropdown or from input
    'timestamp': Timestamp.now(), //todo: format date from input
    'type': type,  //todo: get type from dropdown
  };
}
}
