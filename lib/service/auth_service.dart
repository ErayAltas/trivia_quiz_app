import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:trivia_quiz_app/service/helper.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;

  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log("error : $e");
      Helper.showToastError(e.message ?? "errorOccurred".tr);
    }
    return null;
  }

  Future<UserCredential?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log("error : $e");
      Helper.showToastError(e.message ?? "errorOccurred".tr);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      log("error : $e");
      Helper.showToastError(e.message ?? "errorOccurred".tr);
    }
  }
}
