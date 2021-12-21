// ignore_for_file: unused_field, prefer_final_fields

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:famliciousapp/services/file_upload.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthManager with ChangeNotifier {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FileUploadService _fileUploadService = FileUploadService();

  static String collectionName = 'users';
  CollectionReference userCollection = _firestore.collection(collectionName);

  String _message = '';
  bool _isLoading = false;

  String get message => _message;
  bool get isLoading => _isLoading;

  setMessage(String message) {
    _message = message;
    notifyListeners();
  }

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<bool> createAccount({
    required String email,
    required String password,
    required String fName,
    required File imageUrl,
  }) async {
    setIsLoading(true);

    try {
      final authUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authUser != null) {
        String? url = await _fileUploadService.uploadProfile(
            image: imageUrl, userID: authUser.user!.uid);

        await userCollection.doc(authUser.user!.uid).set({
          'name': fName,
          'email': email,
          'uid': authUser.user!.uid,
          'imageUrl': url,
        });
        setIsLoading(false);
        return true;
      } else {
        setMessage('Something went wrong');
        setIsLoading(false);
        return false;
      }
    } on FirebaseAuthException catch (e) {
      setMessage('Error creating account');
      setIsLoading(false);
      return false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    setIsLoading(true);

    try {
      final authUser = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authUser != null) {
        setIsLoading(false);
        return true;
      } else {
        setMessage('please check your credentials');
        setIsLoading(false);
        return false;
      }
    } on FirebaseAuthException catch (e) {
      setMessage('Error signing in');
      setIsLoading(false);
      return false;
    }
  }
}
