// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class FileUploadService {
  final FirebaseStorage Fstorage = FirebaseStorage.instance;

  Future<String?> uploadProfile(
      {required File image, required String userID}) async {
    try {
      Fstorage.ref().child('profile/$userID.jpg');
      await Fstorage.ref().putFile(image);
      final String ImageUrl = await Fstorage.ref().getDownloadURL();
      return ImageUrl;
    } on FirebaseException catch (e) {
      print(e);
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
