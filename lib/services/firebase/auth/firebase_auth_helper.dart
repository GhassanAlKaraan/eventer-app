// * import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_exceptions/auth_exception_handler.dart';
import 'auth_exceptions/auth_results_status.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late AuthResultStatus _status;
  // * final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  ///
  /// Helper Functions
  ///

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
      print('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  logout() {
    _auth.signOut();
  }
}