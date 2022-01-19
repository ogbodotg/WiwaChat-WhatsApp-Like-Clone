import 'package:flutter/material.dart';
import 'package:wiwa_chat/Model/chatModel.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({Key key, this.name, this.icon}) : super(key: key);
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        child: Icon(icon, color: Colors.white),
        backgroundColor: Colors.blueGrey[200],
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
