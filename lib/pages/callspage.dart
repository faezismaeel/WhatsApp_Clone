// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/pages/callstile.dart';

class CallsPage extends StatefulWidget {
  CallsPage({Key? key}) : super(key: key);

  List<Chat> calls = [
    Chat(
      avatar: "assets/images/group.jpeg",
      isGroup: true,
      name: 'flutter',
      message: "Just now",
    ),
    Chat(
      avatar: "",
      isGroup: false,
      name: 'faiz',
      message: '(3) Today, 10:00am',
    ),
    Chat(
      avatar: "assets/images/person.png",
      isGroup: false,
      name: 'anshad',
      message: 'Yesterday,1:02pm',
    ),
    Chat(
      avatar: "assets/images/group.jpeg",
      isGroup: true,
      name: 'dart ',
      message: '(2) January 13, 12:55pm',
    ),
    Chat(
      avatar: "",
      isGroup: true,
      name: 'cyber team',
      message: "January 10, 5:09pm",
    ),
    Chat(
      avatar: "assets/images/person.png",
      isGroup: true,
      message: '7 hour ago',
      name: 'faiz 2',
    ),
    Chat(
      avatar: "",
      isGroup: false,
      message: 'yesterday 12:09pm',
      name: 'cheppu',
    ),
    Chat(
      avatar: "assets/images/person.png",
      isGroup: false,
      message: 'Just now',
      name: 'Mishab',
    ),
    Chat(
      avatar: "",
      isGroup: false,
      message: 'yesterday 11:11am',
      name: 'sinan',
    ),
  ];

  @override
  _CallsPageState createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.calls.length,
        itemBuilder: (context, index) {
          return CallsTile(
            callsdata: widget.calls[index],
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
            child: Icon(Icons.add_call),
            backgroundColor: Colors.teal[800],
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
