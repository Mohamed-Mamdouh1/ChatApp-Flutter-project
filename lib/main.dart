import 'package:chat_app/screens/chat_Page.dart';
import 'package:chat_app/screens/login_Page.dart';
import 'package:chat_app/screens/register_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RegisterPage.id: (context) {
          return RegisterPage();
        },
        LoginPage.id: (context) {
          return LoginPage();
        },
        ChatPage.id: (context) {
          return ChatPage();
        }
      },
      initialRoute: LoginPage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
