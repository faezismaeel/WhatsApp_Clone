import 'package:flutter/material.dart';

class AppbarMain extends StatefulWidget {
  var tabController;
  AppbarMain({Key? key, required this.tabController}) : super(key: key);

  @override
  _AppbarMainState createState() => _AppbarMainState();
}

class _AppbarMainState extends State<AppbarMain> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('WhatsApp'),
      // backgroundColor: Color(0xFF075E54),
      backgroundColor: Colors.teal[800],
      actions: [
        IconButton(
          onPressed: () {
            // print('hi');
          },
          icon: const Icon(Icons.search),
        ),
        PopupMenuButton(
          itemBuilder: (context) {
            return const [
              PopupMenuItem(
                child: Text('New Group'),
                value: 1,
              ),
              PopupMenuItem(
                child: Text('New Broadcast'),
                value: 2,
              ),
              PopupMenuItem(
                child: Text('Linked Devices'),
                value: 3,
              ),
              PopupMenuItem(
                child: Text('Starred Messages'),
                value: 4,
              ),
              PopupMenuItem(
                child: Text('Payments'),
                value: 5,
              ),
              PopupMenuItem(
                child: Text('Settings'),
                value: 6,
              ),
            ];
          },
          onSelected: (va) {
            // print(va);
          },
        )
        // Icon(Icons.search),
        // Icon(Icons.more_vert),
      ],
      bottom: TabBar(
        controller: widget.tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.camera_alt),
          ),
          Tab(
            text: 'Chats',
          ),
          Tab(
            text: 'Status',
          ),
          Tab(
            text: 'Calls',
          )
        ],
        indicatorColor: Colors.white,
      ),
    );
  }
}
