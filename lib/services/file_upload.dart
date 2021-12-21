// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FileUploadService {
  final FirebaseStorage Fstorage = FirebaseStorage.instance;

  Future<String?> uploadProfile(
      {required File image, required String userID}) async {
    try {
      String? downloadUrl;
      Reference storageRef =
          Fstorage.ref().child("profile").child("$userID.jpg");

      UploadTask storageUploadTask = storageRef.putFile(image);
      TaskSnapshot snapshot = await storageUploadTask
          .whenComplete(() => storageRef.getDownloadURL());

      downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } on FirebaseException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<String?> uploadPost({required File image}) async {
    final String fileName = basename(image.path);
    try {
      Fstorage.ref().child('profile/$fileName.jpg');
      await Fstorage.ref().putFile(image);
      final String ImageUrl = await Fstorage.ref().getDownloadURL();
      return ImageUrl;
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
  }
}
