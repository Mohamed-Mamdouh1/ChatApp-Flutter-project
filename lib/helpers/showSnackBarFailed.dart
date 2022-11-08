import 'package:flutter/material.dart';
void showSnackBar(BuildContext context, String ex) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      "$ex",
      style: const TextStyle(color: Colors.black),
    ),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )),
    backgroundColor: Colors.redAccent,
  ));
}