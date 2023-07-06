import 'package:chat_app2/Cubits/Chat_cubit/chat_cubit.dart';
import 'package:chat_app2/Cubits/Login_cubit/login_cubit.dart';
import 'package:chat_app2/Models/message_Model.dart';
import 'package:chat_app2/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/chat_Bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = 'ChatPage';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController controller = TextEditingController();
  final ScrollController scrollcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments as String;
    List<Message> messageList = [];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 65,
            ),
            Text('Chat')
          ],
        ),
        backgroundColor: Color(0xff274460),
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              if (state is ChatSuccess) {
                messageList = state.messages;
              }
              return ListView.builder(
                reverse: true,
                controller: scrollcontroller,
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return messageList[index].id == email
                      ? ChatBubble(
                          body: messageList[index].body,
                        )
                      : ChatBubbleForFriend(body: messageList[index].body);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            onSubmitted: (data) {
              BlocProvider.of<ChatCubit>(context)
                  .addMessage(message: data, email: email);
              scrollDown();
              controller.clear();
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 6, 152, 108))),
                suffixIcon: IconButton(
                  onPressed: () {
                    String text = controller.text;
                    BlocProvider.of<ChatCubit>(context)
                        .addMessage(email: email, message: text);
                    scrollDown();
                    controller.clear();
                  },
                  icon: Icon(Icons.send),
                  color: KprimaryColor,
                )),
          ),
        )
      ]),
    );
  }

  void scrollDown() {
    scrollcontroller.animateTo(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.fastOutSlowIn,
    );
  }
}
