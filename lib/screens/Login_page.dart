import 'package:chat_app2/Cubits/Chat_cubit/chat_cubit.dart';
import 'package:chat_app2/Cubits/Login_cubit/login_cubit.dart';
import 'package:chat_app2/components/constants.dart';
import 'package:chat_app2/screens/Register_page.dart';
import 'package:chat_app2/screens/chat_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/Custom_Button.dart';
import '../components/customTextFeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatelessWidget {
  String? email;
  String? password;
  bool isLoading = false;
  static String id = 'LogInPage';

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: KprimaryColor,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              isLoading = true;
            }

            if (state is LoginSuccess) {
              isLoading = false;
              BlocProvider.of<ChatCubit>(context).getMessages();
              showSnackBar(context, 'success');
              Navigator.pushNamed(context, ChatPage.id, arguments: email);
            } else if (state is LoginFailed) {
              isLoading = true;
              showSnackBar(context, state.errMassege);
            }
          },
          builder: (context, state) => ModalProgressHUD(
            inAsyncCall: isLoading,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 90,
                    ),
                    Image.asset('assets/images/scholar.png'),
                    Text(
                      'Ahmed Chat',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontFamily: 'Pacifico'),
                    )
                  ],
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(fontSize: 32, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: 'Email',
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextField(
                        onChanged: (data) {
                          password = data;
                        },
                        hintText: 'Password',
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CusomBotton(
                        ontap: () async {
                          if (formKey.currentState!.validate()) {}
                          BlocProvider.of<LoginCubit>(context)
                              .loginUser(email: email!, password: password!);
                        },
                        text: 'Sign in',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an Account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, RegisterPage.id);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Color(0xffC9EDE6)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 15,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
