import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/buttonCard.dart';
import 'package:wiwa_chat/CustomUI/customCard.dart';
import 'package:wiwa_chat/Model/chatModel.dart';
import 'package:wiwa_chat/Screens/homeScreen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  ChatModel chatUser;
  List<ChatModel> chats = [
    ChatModel(
      name: 'Ogbodo ThankGod',
      id: 1,
      isGroup: false,
      currentMessage: 'Hello, welcome to Wiwa Chat',
      time: "12:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Adams Skibi',
      id: 2,
      isGroup: false,
      currentMessage: 'Hi, i am on Wiwa Chat',
      time: "14:00",
      icon: Icons.person,
    ),
    // ChatModel(
    //   name: 'Atutu Poyoyo',
    //   isGroup: true,
    //   currentMessage: 'I am here on Wiwa IM',
    //   time: "12:00",
    //   icon: Icons.group,
    // ),
    // ChatModel(
    //   name: 'Emmanuel Committee',
    //   isGroup: true,
    //   currentMessage: 'I am here on Wiwa IM',
    //   time: "19:00",
    //   icon: Icons.group,
    // ),
    ChatModel(
      name: 'Elizabeth George',
      id: 3,
      isGroup: false,
      currentMessage: 'Hook up with me on Wiwa Chat',
      time: "09:00",
      icon: Icons.person,
    ),
    // ChatModel(
    //   name: 'Shopping Cart',
    //   isGroup: true,
    //   currentMessage: 'New amazing deals',
    //   time: "01:00",
    //   icon: Icons.group,
    // ),
    ChatModel(
      name: 'Kelvin Peters',
      id: 4,
      isGroup: false,
      currentMessage: 'Hey, when\'s the time for our meeting',
      time: "19:00",
      icon: Icons.person,
    ),
    ChatModel(
      name: 'Elizabeth George',
      id: 5,
      isGroup: false,
      currentMessage: 'Hook up with me on Wiwa Chat',
      time: "09:00",
      icon: Icons.person,
    ),
    // ChatModel(
    //   name: 'Shopping Cart',
    //   isGroup: true,
    //   currentMessage: 'New amazing deals',
    //   time: "01:00",
    //   icon: Icons.group,
    // ),
    ChatModel(
      name: 'Kelvin Peters',
      id: 6,
      isGroup: false,
      currentMessage: 'Hey, when\'s the time for our meeting',
      time: "19:00",
      icon: Icons.person,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Select User"),
      // ),
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  chatUser = chats.removeAt(index);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => HomeScreen(
                                chatModels: chats,
                                chatUser: chatUser,
                              )));
                },
                child: ButtonCard(
                  name: chats[index].name,
                  icon: Icons.person,
                ),
                // CustomCard(chatsModel: chats[index]),
              )),
    );
  }
}
