import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String title;
  final String description;
  final String place;
  final Timestamp timestamp;

  Message({
    required this.title,
    required this.description,
    required this.place,
    required this.timestamp,
  });


  //Method: convert message to map.
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'place': place,
      'timestamp': timestamp,
    };
  }
}
