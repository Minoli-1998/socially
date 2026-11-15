import 'package:firebase_auth/firebase_auth.dart';
import 'package:socially_app/services/exceptions/exceptions.dart';

class AuthService {
  // create an instance from auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonymously
  Future<void> signInAnonymously() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      final User? user = userCredential.user;

      if (user != null) {
        String userId = user.uid;
        print("Signed in anonymously : $userId");
      }
    } catch (error) {
      print("Error in sign in anonymously : $error");
    }
  }

  // sign in anonymously with exceptions
  Future<void> signInAnonymouslyWithExceptions() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      final User? user = userCredential.user;

      if (user != null) {
        print("Sign in anonymously user id : ${user.uid}");
      }
    } on FirebaseAuthException catch (error) {
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("Error in sign in anonymously with exceptions: $error");
    }
  }

  // method to sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();

      // display message in console
      print("User signed out");
    } on FirebaseAuthException catch (error) {
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("Error in sign out : $error");
    }
  }

  // get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // create user with password and email
  Future<UserCredential> createUserWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (error) {
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      throw Exception(
        "Error in creating user with email and password : $error",
      );
    }
  }

  // sign in with user email and password
  Future<void> signInWithEmailPasssword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (error) {
      throw Exception(mapFirebaseAuthExceptionCode(error.code));
    } catch (error) {
      print("Error in sign in with email and password : $error");
    }
  }
}
