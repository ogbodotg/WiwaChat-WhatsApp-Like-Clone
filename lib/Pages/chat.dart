import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/customCard.dart';
import 'package:wiwa_chat/Model/chatModel.dart';
import 'package:wiwa_chat/Screens/selectContact.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key key, this.chatModels, this.chatUser}) : super(key: key);
  final List<ChatModel> chatModels;
  final ChatModel chatUser;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
        itemCount: widget.chatModels.length,
        itemBuilder: (context, index) => CustomCard(
          chatsModel: widget.chatModels[index],
          chatUser: widget.chatUser,
        ),
      ),
    );
  }
}
