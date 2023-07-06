import 'package:chat_app2/Cubits/Login_cubit/login_cubit.dart';
import 'package:chat_app2/Cubits/Resgister_cubit/register_cubit.dart';
import 'package:chat_app2/components/constants.dart';
import 'package:chat_app2/screens/Login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/Custom_Button.dart';
import '../components/customTextFeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'chat_Page.dart';

class RegisterPage extends StatelessWidget {
  String? email;
  static String id = 'RegisterPage';
  String? password;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        backgroundColor: KprimaryColor,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterLoading) {
              isLoading = true;
            }
            if (state is RegisterSuccess) {
              isLoading = false;
              showSnackBar(context, 'success');
              Navigator.pushNamed(context, ChatPage.id);
            } else if (state is RegisterFailed) {
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
                        'Register',
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
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterCubit>(context)
                                .registerUser(
                                    email: email!, password: password!);
                          }
                        },
                        text: 'Sign Up',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "already have an Account? ",
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginPage.id);
                            },
                            child: Text(
                              'Sign in',
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

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(50),
      elevation: 30,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
