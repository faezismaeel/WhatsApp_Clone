import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
// import 'package:whatsapp/pages/chattile.dart';å
import 'package:whatsapp/pages/statustile.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key? key}) : super(key: key);

  List<Chat> status = [
    Chat(
      avatar: "assets/images/group.jpeg",
      isGroup: true,
      message: 'Just now',
      name: 'flutter',
    ),
    Chat(
      avatar: "",
      isGroup: false,
      message: 'yesterday 11:39pm',
      name: 'faiz',
    ),
    Chat(
      avatar: "assets/images/person.png",
      isGroup: false,
      message: '2 min ago',
      name: 'anshad',
    ),
    Chat(
      avatar: "assets/images/group.jpeg",
      isGroup: true,
      message: '3 hour ago',
      name: 'dart ',
    ),
    Chat(
      avatar: "",
      isGroup: true,
      message: 'Just now',
      name: 'cyber team',
    ),
    Chat(
      avatar: "assets/images/group.jpeg",
      isGroup: false,
      message: 'Just now',
      name: 'mhd',
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
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.status.length,
        itemBuilder: (context, index) {
          return StatusTile(statusdata: widget.status[index]);
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.teal[800],
              elevation: 0,
              child: const Icon(Icons.edit),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              // print('pressed');
            },
            child: const Icon(Icons.camera_alt),
            backgroundColor: Colors.teal[800],
            elevation: 0,
          ),
        ],
      ),
    );
  }
}
