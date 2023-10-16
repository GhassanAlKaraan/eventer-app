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
  Map<String, dynamic> _event = {}; //event data
  Map<String, dynamic> _organiser = {}; //organiser data
  //*
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final eventData = await firestoreService.getEventById(widget.id);
    setState(() {
      _event = eventData;
    });
    final userData = await firestoreService.getUserByEmail(_event['organiser']);
    setState(() {
      _organiser = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: _event.isEmpty || _organiser.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: //DetailsCard(eventDetails: _event, organiserDetails: _organiser),
              Column( //todo: replace with details card
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_event['title'], style: kTxtStyle2),
                  Text(_event['description'], style: kTxtStyle2),
                  Flexible(
                      child:
                          Text(_event['timestamp'].toString(), style: kTxtStyle2)),
                  Text(_event['place'], style: kTxtStyle2),
                  Text(_event['type'], style: kTxtStyle2),
                  Text(_event['organiser'], style: kTxtStyle2),
                  Text(_organiser['firstName'], style: kTxtStyle2),
                  Text(_organiser['phoneNumber'], style: kTxtStyle2),
                ],
              ),
            ),
    );
  }
}
