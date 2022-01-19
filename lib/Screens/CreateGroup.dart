import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/avatarCard.dart';
import 'package:wiwa_chat/CustomUI/buttonCard.dart';
import 'package:wiwa_chat/CustomUI/contactCard.dart';
import 'package:wiwa_chat/Model/chatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("New Group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            Text("Add contacts to new group", style: TextStyle(fontSize: 13))
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 26,
              )),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index - 1].select == true) {
                        groups.remove(contacts[index - 1]);
                        contacts[index - 1].select = false;
                      } else {
                        contacts[index - 1].select = true;
                        groups.add(contacts[index - 1]);
                      }
                    });
                  },
                  child: ContactCard(
                    contact: contacts[index - 1],
                  ),
                );
              }),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].select = false;
                                    groups.remove(contacts[index]);
                                  });
                                },
                                child: AvatarCard(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
