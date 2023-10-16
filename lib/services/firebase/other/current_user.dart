import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCurrentUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  //* Get the current user data from Firebase *//
  // Map<String, dynamic> _userToMap(User user) {
  //   return {
  //     'uid': user.uid,
  //     'email': user.email, // * this is the PK
  //     'displayName': user.displayName
  //   };
  // }

  Future<String> getCurrentUserEmail() async {
    try {
      User user = _auth.currentUser!;
      return user.email!;
    } catch (e) {
      return "";
    }
  }

  //* Get the current user first name from Firestore *//
  Future<String> getUserName() async {
    String email = await getCurrentUserEmail();

    DocumentSnapshot ds = await _users.doc(email).get();

    if (ds.exists) {
      final Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      final String firstName = map['firstName'];
      return firstName;
    } else {
      return "";
    }
  }
}
