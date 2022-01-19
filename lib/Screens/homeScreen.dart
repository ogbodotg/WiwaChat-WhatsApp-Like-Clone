import 'package:flutter/material.dart';
import 'package:wiwa_chat/Pages/cameraPage.dart';
import 'package:wiwa_chat/Pages/chat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wiwa Chat'),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New Group"),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text("New Broadcast"),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text("Linked Devices"),
                value: "Linked devices",
              ),
              PopupMenuItem(
                child: Text("Starred Messages"),
                value: "Starred messages",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          ChatPage(),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}
