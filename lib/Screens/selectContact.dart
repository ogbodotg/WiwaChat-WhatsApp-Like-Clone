import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/buttonCard.dart';
import 'package:wiwa_chat/CustomUI/contactCard.dart';
import 'package:wiwa_chat/Model/chatModel.dart';
import 'package:wiwa_chat/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key key}) : super(key: key);

  @override
  _SelectContactState createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "Ogbodo ThankGod",
        status: "Lover of God",
      ),
      ChatModel(
        name: "OS Technology",
        status: "IT Services",
      ),
      ChatModel(
        name: "Wiwa",
        status: "You, Artists & Vendors",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Contact",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text("100 Contacts", style: TextStyle(fontSize: 13))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("Invite friends"),
                value: "Invite a friend",
              ),
              PopupMenuItem(
                child: Text("Contacts"),
                value: "Contacts",
              ),
              PopupMenuItem(
                child: Text("Refresh"),
                value: "Refresh",
              ),
              PopupMenuItem(
                child: Text("Help"),
                value: "Help",
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(icon: Icons.group, name: "New Group"));
            } else if (index == 1) {
              return ButtonCard(icon: Icons.person_add, name: "New Contact");
            }
            return ContactCard(
              contact: contacts[index - 2],
            );
          }),
    );
  }
}
