import 'package:flutter/material.dart';
void showSnackBarSuc(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    content:  Row(

      children: const [
        Text(
          "Success",
          style:  TextStyle(color: Colors.black),
        ),Spacer(flex: 1,),
        Icon(Icons.check_circle,color: Colors.green,)
      ],
    ),
    shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )),
    backgroundColor: Colors.white,
  ));
}