import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
Future<void> userLogin(String? email ,String?password) async {
  FirebaseAuth auth=FirebaseAuth.instance;
  UserCredential userCredential =
  await auth.signInWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}