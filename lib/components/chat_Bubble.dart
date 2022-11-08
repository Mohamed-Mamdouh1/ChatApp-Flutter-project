import 'package:chat_app/models/messages.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Bubble extends StatelessWidget {
  Message message;
   Bubble({required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
class Sbubble extends StatelessWidget {
  Message message;
  Sbubble({required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          padding:
          const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
                topLeft: Radius.circular(30),
              )),
          child: Text(
            message.message,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
