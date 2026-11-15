import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class UserProfileStorageService {
  // create an instance from the storage
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // method to get download url for upload profile image
  Future<String> uploadImage({
    required File profileImage,
    required String userEmail,
  }) async {
    // reference for the folder in storage
    final Reference ref = _storage
        .ref()
        .child("profile-images")
        .child("$userEmail/${DateTime.now()}");

    try {
      final UploadTask task = ref.putFile(
        profileImage,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      final TaskSnapshot snapshot = await task;
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (error) {
      print("Error in getting url for image : $error");
      return "";
    }
  }
}
