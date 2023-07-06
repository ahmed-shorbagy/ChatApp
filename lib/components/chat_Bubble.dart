import 'package:chat_app2/Models/message_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({
    required this.body,
    super.key,
  });
  String body;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Text(
            '$body ',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 69, 25, 145),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(26),
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26))),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({
    required this.body,
    super.key,
  });
  String body;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Text(
            '$body ',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 44, 88, 219),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(26),
                bottomRight: Radius.circular(26),
                topLeft: Radius.circular(26),
              )),
        ),
      ),
    );
  }
}
