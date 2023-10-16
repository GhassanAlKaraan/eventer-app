import 'package:eventer/services/firebase/firestore/firestore_service.dart';
import 'package:eventer/utility/constants.dart';
import 'package:flutter/material.dart';

//todo: design the event details page

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  //*
  FirestoreService firestoreService = FirestoreService();
  Map<String, dynamic>? map;
  //*
  @override
  void initState() {
    super.initState();
    firestoreService.getEventById(widget.id).then((eventData) {
      setState(() {
        map = eventData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: map == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(map!['title'], style: kTxtStyle2),
                  Text(map!['description'], style: kTxtStyle2),
                  Flexible(child: Text(map!['timestamp'].toString(), style: kTxtStyle2)),
                  Text(map!['place'], style: kTxtStyle2),
                  Text(map!['type'], style: kTxtStyle2),
                  Text(map!['organiser'], style: kTxtStyle2),
                ],
              ),
            ),
    );
  }
}
