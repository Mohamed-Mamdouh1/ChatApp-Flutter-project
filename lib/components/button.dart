import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.buttonText, required this.action})
      : super(key: key);
  final VoidCallback? action;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: action,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(4, 4),
                  spreadRadius: 4,
                  blurRadius: 7)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
            '$buttonText',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ))),
    );
  }
}
