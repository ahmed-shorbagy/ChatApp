import 'package:flutter/foundation.dart';

class Message {
  String body;
  String id;
  Message(this.body, this.id);
  factory Message.fromJson(jsonData) {
    return Message(jsonData['message'], jsonData['id']);
  }
}
