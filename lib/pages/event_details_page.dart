import 'package:eventer/services/firebase/firestore/firestore_service.dart';
import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({super.key, required this.id});

  final String id;

  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}
class _EventDetailsPageState extends State<EventDetailsPage> {
  FirestoreService firestoreService = FirestoreService();
  Map<String, dynamic>? map;

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
      body: const Center(
        child: Text('Event Details'),
      ),
    );
  }
}