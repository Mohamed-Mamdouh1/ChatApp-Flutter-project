import 'package:chat_app/constants/constants.dart';
import 'package:chat_app/models/messages.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import '../components/chat_Bubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final sController = ScrollController();
  bool isDark = true;
  static String id = "ChatPage";
  TextEditingController controller = TextEditingController();
  CollectionReference messages = FirebaseFirestore.instance.collection('me');
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kTime, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(snapshot.data!.docs[i]));
            }
            ;
            return Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                        icon: Icon(
                          Icons.light_mode,
                          color: kPrimaryColor,
                        ),
                        onPressed: () {},
                      )),
                ),
                backgroundColor: kPrimaryColor,
                title: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        kImage,
                        scale: 2,
                      ),
                      Text("Chat")
                    ],
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: sController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList[index].id == email
                              ? Bubble(
                                  message: messageList[index],
                                )
                              : Sbubble(
                                  message: messageList[index],
                                );
                        }),
                  ),
                  TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      messages.add(
                        {'mes': data, kTime: DateTime.now(), kId: email},
                      );
                      controller.clear();
                      sController.animateTo(0,
                          duration: Duration(seconds: 1),
                          curve: Curves.easeInOut);
                    },
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        hintText: "Enter your Message",
                        suffix: const Icon(
                          Icons.send,
                          color: kPrimaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 18),
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
