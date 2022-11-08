import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({Key? key, required this.hintText, required this.onChanged,this.obSecureText=false})
      : super(key: key);
  Function(String) onChanged;
  String? hintText;
  bool? obSecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obSecureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return "This Field can't be Empty";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade300,
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          )),
    );
  }
}
