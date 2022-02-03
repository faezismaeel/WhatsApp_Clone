import 'package:flutter/material.dart';
import 'package:whatsapp/pages/chatpage.dart';
import 'package:whatsapp/pages/statuspage.dart';
import 'package:whatsapp/widgets/appbar_main.dart';
import 'pages/callspage.dart';

void main() {
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WhatsAppHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppbarMain(
              tabController: tabController,
            ),
          ),
          body: TabBarView(
            children: [
              Text('Camera'),
              ChatPage(),
              StatusPage(),
              CallsPage(),
            ],
            controller: tabController,
          )),
    );
  }
}
