import 'package:chat_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

import '../components/button.dart';
import '../components/text_field.dart';
import '../helpers/showSnackBarFailed.dart';
import '../helpers/showSnackBarSuc.dart';
import '../helpers/user_registration.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
  static String id = "RegisterPage";
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProgressHUD(
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 10,
        ),
        borderWidth: 20,
        backgroundColor: Colors.white,
        indicatorColor: Colors.blue,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Register"),
            backgroundColor: kPrimaryColor,
          ),
          backgroundColor: kPrimaryColor,
          body: Form(
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
                                "Register",
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
                            hintText: "Enter Your Email",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomField(
                            onChanged: (data) {
                              password = data;
                            },
                            hintText: "Enter Your Password",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                              buttonText: "Register",
                              action: () async {
                                final progress = ProgressHUD.of(context);

                                if (formKey.currentState!.validate()) {
                                  progress!.showWithText("Loading....");
                                  await Future.delayed(Duration(seconds: 2),
                                          () {
                                        progress.dismiss();
                                      });
                                  try {
                                    await registerUser(email, password);
                                    showSnackBarSuc(context);
                                  } catch (ex) {
                                    showSnackBar(context, ex.toString());
                                  }
                                }
                              }),
                          const SizedBox(
                            height: 15,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: const [
                            //     Text(
                            //       "don't have an account?",
                            //       style: TextStyle(color: Colors.white),
                            //     ),
                            //     Text(
                            //       "  Register Now",
                            //       style: TextStyle(
                            //         color: Color(0Xff9bc0c0),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),
                          CustomButton(
                            buttonText: "Back To Login Page",
                            action: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

}
