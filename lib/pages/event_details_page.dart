import 'package:eventer/services/firebase/firestore/firestore_service.dart';
import 'package:eventer/utility/constants.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  //*
  FirestoreService firestoreService = FirestoreService();
  Map<String, dynamic> map = {}; //event data
  Map<String, dynamic> user = {}; //organiser data
  //*
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final eventData = await firestoreService.getEventById(widget.id);
    setState(() {
      map = eventData;
    });
    final userData = await firestoreService.getUserByEmail(map['organiser']);
    setState(() {
      user = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: map.isEmpty || user.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Center(
              //todo: replace with details_card when it's ready
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(map['title'], style: kTxtStyle2),
                  Text(map['description'], style: kTxtStyle2),
                  Flexible(
                      child:
                          Text(map['timestamp'].toString(), style: kTxtStyle2)),
                  Text(map['place'], style: kTxtStyle2),
                  Text(map['type'], style: kTxtStyle2),
                  Text(map['organiser'], style: kTxtStyle2),
                  Text(user['firstName'], style: kTxtStyle2),
                  Text(user['phoneNumber'], style: kTxtStyle2),
                ],
              ),
            ),
    );
  }
}
