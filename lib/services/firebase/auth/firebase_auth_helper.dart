// * import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_exceptions/auth_exception_handler.dart';
import 'auth_exceptions/auth_results_status.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late AuthResultStatus _status;

  // todo: Create register method, and add the user info to the users collection.

  Future<AuthResultStatus> login({email, pass}) async {
    try {
      final authResult =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);

      if (authResult.user != null) {
        _status = AuthResultStatus.successful;
      } else {
        _status = AuthResultStatus.undefined;
      }
    } catch (e) {
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future logout() async {
    await _auth.signOut();
  }

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
}
