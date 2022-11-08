import 'package:chat_app/constants/constants.dart';

class Message{
  String message;
  String id;
  Message(this.message,this.id);

  factory Message.fromJson(jsonData){
    return Message(jsonData['mes'],jsonData[kId]);
  }

}