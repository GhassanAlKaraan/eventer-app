import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eventer/services/firebase/firestore/firestore_service.dart';
import 'package:eventer/utility/constants.dart';
import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('All Events')),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getEventsStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                'No events found',
              ),
            );
          } else {
            final docs = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                primary: true, // scrollable : true
                shrinkWrap: true,
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  // the document snapshot is a map
                  DocumentSnapshot ds = docs[index];
                  // to keep track of the notes, we need the document id
                  String docId = ds.id; //todo: use this to open the details.
                  // get the text from the map
                  String title = ds['title'];
                  String type = ds['type'];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: Colors.white,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: kTxtStyle0,
                          ),
                        ],
                      ),
                      leading: EventType(type: type, index: index),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

class EventType extends StatelessWidget {
  const EventType({
    super.key,
    required this.type,
    required this.index,
  });

  final String type;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HorizontalSliceClipper(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(8.0),
          //   bottomLeft: Radius.circular(8.0),
          // ),
          color: index % 2 == 0
              ? Colors.indigoAccent
              : Colors.indigo[400],
        ),
        height: 70,
        width: 140,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 10.0),
            const Icon(
              Icons.outdoor_grill, //todo: change icon.
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 5.0),
            Text(
              type,
              style: kTxtStyle1,
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalSliceClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0); // Start at the top-left corner
    path.lineTo(size.width, 0); // Move to 5% from the right edge
    path.lineTo(size.width * 0.85, size.height); // Move down to the same point
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.15, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}