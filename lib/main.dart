import 'package:chat_app2/Cubits/Chat_cubit/chat_cubit.dart';
import 'package:chat_app2/Cubits/Login_cubit/login_cubit.dart';
import 'package:chat_app2/Cubits/Resgister_cubit/register_cubit.dart';
import 'package:chat_app2/screens/Login_page.dart';
import 'package:chat_app2/screens/Register_page.dart';
import 'package:chat_app2/screens/chat_Page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp2());
}

class ChatApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
