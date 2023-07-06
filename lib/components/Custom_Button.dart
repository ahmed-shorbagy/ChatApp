import 'package:chat_app2/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CusomBotton extends StatelessWidget {
  CusomBotton({required this.text, this.ontap});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 45,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: KprimaryColor, fontSize: 22),
        )),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
