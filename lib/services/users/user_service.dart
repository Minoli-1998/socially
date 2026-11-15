import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:socially_app/models/user_model.dart';
import 'package:socially_app/services/auth/auth_service.dart';

class UserService {
  // create a collection reference
  final CollectionReference _userCollection = FirebaseFirestore.instance
      .collection("users");

  // save user in the firestore database
  Future<void> saveUser(UserModel user) async {
    try {
      // create a new user with email and password
      final UserCredential userCredential = await AuthService()
          .createUserWithEmailPassword(
            email: user.email,
            password: user.password,
          );

      // retrieve the user id from the created user
      final String? userId = userCredential.user?.uid;

      if (userId != null) {
        // create a new user document in firestore with user id as the document id
        final DocumentReference doc = _userCollection.doc(userId);

        // create a user map with the user id fields
        final Map<String, dynamic> userMap = user.toJson();
        userMap['userId'] = userId;

        // set the user data in firestore
        await doc.set(userMap);
      } else {
        throw Exception("The user id is null");
      }
    } catch (error) {
      throw Exception("Error in saving new user : $error");
    }
  }
}
