import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/chattile.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  List<Chat> chat = [
    Chat(
        avatar: "assets/images/group.jpeg",
        isGroup: true,
        message: 'sir: nala class 9 manikk',
        name: 'flutter',
        updatedAt: '10.00am'),
    Chat(
        avatar: "",
        isGroup: false,
        message: 'nice',
        name: 'faiz',
        updatedAt: '11.03am'),
    Chat(
        avatar: "assets/images/person.png",
        isGroup: false,
        message: 'good',
        name: 'anshad',
        updatedAt: '10.30am'),
    Chat(
        avatar: "assets/images/group.jpeg",
        isGroup: true,
        message: 'faiz: hi good morning',
        name: 'dart ',
        updatedAt: '10.09pm'),
    Chat(
        avatar: "",
        isGroup: true,
        message: 'mhd: kooi',
        name: 'cyber team',
        updatedAt: '7;00am'),
    Chat(
      avatar: "assets/images/group.jpeg",
      isGroup: false,
      message: 'Just now',
      name: 'mhd',
      updatedAt: '88',
    ),
    Chat(
      avatar: "assets/images/person.png",
      isGroup: true,
      message: '7 hour ago',
      name: 'faiz 2',
      updatedAt: '88',
    ),
    Chat(
      avatar: "",
      isGroup: false,
      message: 'yesterday 12:09pm',
      name: 'cheppu',
      updatedAt: '88',
    ),
    Chat(
      avatar: "assets/images/person.png",
      isGroup: false,
      message: 'Just now',
      updatedAt: '88',
      name: 'Mishab',
    ),
    Chat(
      avatar: "",
      isGroup: false,
      message: 'yesterday 11:11am',
      name: 'sinan',
      updatedAt: '88',
    ),
  ];

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.chat.length,
        itemBuilder: (context, index) {
          return Chattile(
            chatdata: widget.chat[index],
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            // child: FloatingActionButton(
            //   onPressed: () {},
            //   backgroundColor: Colors.teal[800],
            //   elevation: 0,
            // ),
          ),
          FloatingActionButton(
            onPressed: () {
              // print('pressed');
            },
            child: Icon(Icons.chat),
            backgroundColor: Colors.teal[800],
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
