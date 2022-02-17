import 'package:flutter/material.dart';
import 'package:wiwa_chat/Model/chatModel.dart';
import 'package:wiwa_chat/Pages/individualChats.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key key, this.chatsModel, this.chatUser}) : super(key: key);
  final ChatModel chatsModel;
  final ChatModel chatUser;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => IndividualChats(
                      chatsModel: chatsModel,
                      chatUser: chatUser,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Icon(chatsModel.isGroup ? Icons.groups : Icons.person,
                  color: Colors.white, size: 38),
              backgroundColor: Colors.purple[400],
            ),
            title: Text(
              chatsModel.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(
                  width: 3,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    chatsModel.currentMessage,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
            trailing: Text(chatsModel.time),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
