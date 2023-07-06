import 'package:bloc/bloc.dart';
import 'package:chat_app2/Models/message_Model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../components/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KmessagesCollection);
  void addMessage({required String message, required String email}) {
    messages
        .add({'message': message, 'id': email, 'created at': DateTime.now()});
  }

  void getMessages() {
    firestore
        .collection(KmessagesCollection)
        .orderBy('created at', descending: true)
        .snapshots()
        .listen((event) {
      List<Message> messgaeList = [];
      for (var doc in event.docs) {
        messgaeList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messgaeList));
    });
  }
}
