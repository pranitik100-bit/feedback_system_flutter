import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ------------------------------------------------------------
  // STUDENT LOGIN
  // ------------------------------------------------------------

  Future<User?> loginStudent({
    required String enrollmentNumber,
    required String password,
  }) async {
    try {
      // Firebase Authentication requires an email.
      // Students will only enter their enrollment number.
      final email =
          '${enrollmentNumber.trim().toLowerCase()}@student.feedback';

      final UserCredential result =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return result.user;
    } on FirebaseAuthException catch (e) {
      throw _getAuthErrorMessage(e.code);
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  // ------------------------------------------------------------
  // LOGOUT
  // ------------------------------------------------------------

  Future<void> logout() async {
    await _auth.signOut();
  }

  // ------------------------------------------------------------
  // CURRENT USER
  // ------------------------------------------------------------

  User? get currentUser {
    return _auth.currentUser;
  }

  // ------------------------------------------------------------
  // AUTH STATE
  // ------------------------------------------------------------

  Stream<User?> get authStateChanges {
    return _auth.authStateChanges();
  }

  // ------------------------------------------------------------
  // ERROR MESSAGES
  // ------------------------------------------------------------

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Student account not found.';

      case 'wrong-password':
      case 'invalid-credential':
        return 'Invalid enrollment number or password.';

      case 'invalid-email':
        return 'Invalid enrollment number.';

      case 'user-disabled':
        return 'This student account has been disabled.';

      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';

      case 'network-request-failed':
        return 'Please check your internet connection.';

      default:
        return 'Login failed. Please try again.';
    }
  }
}
