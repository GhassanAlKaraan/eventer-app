import 'package:firebase_auth/firebase_auth.dart';

import 'auth_exception_handler.dart';
import 'auth_results_status.dart';

class FirebaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late AuthResultStatus _status;

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