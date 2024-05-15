import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<ChatUser> typing = [];
  ChatUser myself = ChatUser(id: '1', firstName: 'Akshay');
  ChatUser bot = ChatUser(id: '2', firstName: 'Self Edify');
  List<ChatMessage> allMessages = [];

  final ourl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyABJxwjM6yCMr3faKUhqmiHtOXPisdIomA';
  final header = {'Content-Type': 'application/json'};
  void getData(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };
    await http
        .post(Uri.parse(ourl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);
        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());
        allMessages.insert(0, m1);
        
      } else {
        print("Error Occoured");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ask your Doubts!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),),toolbarHeight: 100,),
      body: DashChat(
          typingUsers: typing,
          
          currentUser: myself,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages: allMessages,
          inputOptions: InputOptions(
            cursorStyle: CursorStyle(color: Colors.black)
          ),
          messageOptions: MessageOptions(
            currentUserContainerColor: Colors.red
          ),
         
        
          
          ),
    );
  }
}
