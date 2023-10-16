import 'package:eventer/components/my_button2.dart';
import 'package:eventer/services/firebase/firestore/firestore_service.dart';
import 'package:eventer/services/firebase/other/current_user.dart';
import 'package:eventer/utility/constants.dart';
import 'package:flutter/material.dart';

import '../components/loading_button.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../models/event_model.dart';
import '../utility/utils.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    placeController.dispose();
    typeController.dispose();
    super.dispose();
  }

  //* FireStore Instance *//
  final FirestoreService _firestore = FirestoreService();

  final FirebaseCurrentUser _firebaseUser = FirebaseCurrentUser();

  bool isButtonClicked = false;
  void _toggleButtonState() {
    setState(() {
      isButtonClicked = !isButtonClicked;
    });
  }

  bool isLoading = true;
  String username = "";

  void getCurrentUserName() async {
    print("Getting current user name");
    username = await _firebaseUser.getUserName();
    print("Username: $username");
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserName();
  }

  void _createEvent() {
    _toggleButtonState();
    //* Handle empty fields *//
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        placeController.text.isEmpty ||
        typeController.text.isEmpty) {
      Utility.showSnackBar(context, "Please fill in all fields");
      _toggleButtonState();
      return;
    }
    //* Create EventModel *//
    EventModel eventModel = EventModel(
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      place: placeController.text.trim(),
      type: typeController.text.trim(),
      organiser: username, //todo: get current user name
    );
    //* Create Event in Firestore *//
    try {
      _firestore.createEvent(eventModel);
      Utility.showSnackBar(context, "Event Created");
    } catch (e) {
      Utility.showSnackBar(context, "Creation failed");
      print(e);
    } finally {
      _toggleButtonState();
    }

    
    titleController.clear();
    descriptionController.clear();
    placeController.clear();
    typeController.clear();
    Navigator.pop(context);
  }

  void _clearFields() {
    if (titleController.text.isEmpty &&
        descriptionController.text.isEmpty &&
        placeController.text.isEmpty &&
        typeController.text.isEmpty) {
      Utility.showSnackBar(context, "Fields are already empty");
      return;
    }

    titleController.clear();
    descriptionController.clear();
    placeController.clear();
    typeController.clear();
    Utility.showSnackBar(context, "Done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Event'),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        MyTextField(
                          labelText: 'Event Title',
                          isObscure: false,
                          controller: titleController,
                        ),
                        const SizedBox(height: 20.0),
                        MyTextField(
                          labelText: 'Event Description',
                          isObscure: false,
                          controller: descriptionController,
                        ),
                        const SizedBox(height: 20.0),
                        MyTextField( //todo: add dropdown menu
                          labelText: 'Event Place',
                          isObscure: false,
                          controller: placeController,
                        ),
                        const SizedBox(height: 20.0),
                        MyTextField( //todo: add dropdown menu
                          labelText: 'Event Type',
                          isObscure: false,
                          controller: typeController,
                        ),
                        const SizedBox(height: 20.0),
                        const Text( //todo: add date and time picker
                          "Event Date and Time (Pending)",
                          style: kTxtStyle2,
                        ),
                        const SizedBox(height: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            MyButton(text: "CLEAR", onTap: _clearFields),
                            isButtonClicked
                                ? const LoadingButton(text: "Loading")
                                : MyButton2(text: "ADD", onTap: _createEvent),
                            const SizedBox(height: 20.0),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}
