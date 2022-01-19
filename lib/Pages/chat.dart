import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/customCard.dart';
import 'package:wiwa_chat/Model/chatModel.dart';
import 'package:wiwa_chat/Screens/selectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Ogbodo ThankGod',
      isGroup: false,
      currentMessage: 'Hello, welcome to Wiwa Chat',
      time: "12:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Adams Skibi',
      isGroup: false,
      currentMessage: 'Hi, i am on Wiwa Chat',
      time: "14:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Atutu Poyoyo',
      isGroup: true,
      currentMessage: 'I am here on Wiwa IM',
      time: "12:00",
      icon: Icons.group,
    ),
    ChatModel(
      name: 'Emmanuel Committee',
      isGroup: true,
      currentMessage: 'I am here on Wiwa IM',
      time: "19:00",
      icon: Icons.group,
    ),
    ChatModel(
      name: 'Elizabeth George',
      isGroup: false,
      currentMessage: 'Hook up with me on Wiwa Chat',
      time: "09:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Shopping Cart',
      isGroup: true,
      currentMessage: 'New amazing deals',
      time: "01:00",
      icon: Icons.group,
    ),
    ChatModel(
      name: 'Kelvin Peters',
      isGroup: false,
      currentMessage: 'Hey, when\'s the time for our meeting',
      time: "19:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Elizabeth George',
      isGroup: false,
      currentMessage: 'Hook up with me on Wiwa Chat',
      time: "09:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Shopping Cart',
      isGroup: true,
      currentMessage: 'New amazing deals',
      time: "01:00",
      icon: Icons.group,
    ),
    ChatModel(
      name: 'Kelvin Peters',
      isGroup: false,
      currentMessage: 'Hey, when\'s the time for our meeting',
      time: "19:00",
      icon: Icons.person,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: Icon(Icons.edit),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(chatsModel: chats[index]),
        ));
  }
}
