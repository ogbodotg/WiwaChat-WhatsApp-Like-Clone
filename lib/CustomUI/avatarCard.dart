import 'package:flutter/material.dart';
import 'package:wiwa_chat/Model/chatModel.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key key, this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                child: Icon(Icons.person, color: Colors.white),
                backgroundColor: Colors.blueGrey[200],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 13,
                    child: Icon(Icons.clear, color: Colors.white, size: 18)),
              )
            ],
          ),
          SizedBox(height: 2),
          Text(
            contact.name,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
