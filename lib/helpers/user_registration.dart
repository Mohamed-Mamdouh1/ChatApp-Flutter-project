import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
Future<void> registerUser(String ? email,String ? password) async {

  FirebaseAuth auth=FirebaseAuth.instance;


  UserCredential userCredential = await auth.createUserWithEmailAndPassword(
    email: email!,
    password: password!,
  );
}
