// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/text_field.dart';
import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/screens/chat_Page.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../helpers/showSnackBarFailed.dart';
import '../helpers/showSnackBarSuc.dart';
import '../helpers/user_login.dart';

class LoginPage extends StatelessWidget {
  String? email, password;
  GlobalKey<FormState> formKey = GlobalKey();
  FirebaseAuth auth = FirebaseAuth.instance;

  static String id = "LoginPage";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: ProgressHUD(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
        borderWidth: 20,
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue,
        child: Form(
          key: formKey,
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        Image.asset('assets/image/scholar.png'),
                        const Text(
                          "Scholar Chat ",
                          style: TextStyle(
                            fontFamily: "Pacifico",
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: "Pacifico",
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomField(
                            onChanged: (data) {
                              email = data;
                            },
                            hintText: "Enter Your Email"),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomField(
                          obSecureText: true,
                            onChanged: (data) {
                              password = data;
                            },
                            hintText: "Enter Your Password"),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          buttonText: "Login",
                          action: () async {
                            final progress = ProgressHUD.of(context);
                            if (formKey.currentState!.validate()) {
                              progress!.showWithText("Loading....");
                              await Future.delayed(const Duration(seconds: 2),
                                  () {
                                progress.dismiss();
                              });
                              try {
                                progress.showWithText("Loading....");
                                await Future.delayed(const Duration(seconds: 2),
                                        () {
                                      progress.dismiss();
                                    });
                                await userLogin(email!, password!);


                                showSnackBarSuc(context);
                                progress
                                    .showWithText("login in 2 second......");
                                await Future.delayed(const Duration(seconds: 2),
                                    () {
                                  progress.dismiss();
                                });
                                await Future.delayed(
                                    const Duration(seconds: 1), () {});
                                Navigator.pushNamed(context, ChatPage.id,
                                    arguments: email);
                              } on FirebaseAuthException catch (ex) {
                                if (ex.code == 'user-not-found') {
                                  showSnackBar(
                                      context, 'No user found for that email.');
                                } else if (ex.code == 'wrong-password') {
                                  showSnackBar(context,
                                      'Wrong password provided for that user.');
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "RegisterPage");
                              },
                              child: const Text(
                                "  Register Now",
                                style: TextStyle(
                                  color: Color(0Xff9bc0c0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
