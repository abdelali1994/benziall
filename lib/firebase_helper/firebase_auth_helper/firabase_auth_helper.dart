import 'package:ecommerce_with_admin_panel/constants/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
 static FirebaseAuthHelper instance = FirebaseAuthHelper();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthChange => _auth.authStateChanges();
  Future<bool> login(String email, String password, context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code.toString());

      return false;
    }
  }
    Future<bool> signUp(String email, String password, context) async {
    try {
      showLoaderDialog(context);
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code.toString());

      return false;
    }
  }
}
// class FirebaseAuthHelper {
//   static FirebaseAuthHelper instance = FirebaseAuthHelper();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Stream<User?> get getAuthChange => _auth.authStateChanges();

//   Future<bool> login(
//       String email, String password,  context) async {
//     try {
//               showLoaderDialog(context);
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       Navigator.of(context,rootNavigator: true).pop();
//       return true;
//     } on FirebaseAuthException catch (error) {
//       // Navigator.of(context,rootNavigator: true).pop();
 
//       showMessage(error.code.toString());
//       return false;
//     }
//   }
  // }
