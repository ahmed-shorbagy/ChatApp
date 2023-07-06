import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.hintText, this.onChanged});
  Function(String)? onChanged;
  String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'this Field is required';
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5))));
  }
}
