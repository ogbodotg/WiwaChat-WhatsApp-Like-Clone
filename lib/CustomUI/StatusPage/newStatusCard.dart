import 'package:flutter/material.dart';

class NewStatusCard extends StatelessWidget {
  const NewStatusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Colors.white,
            backgroundImage: null,
            child: Icon(Icons.person),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircleAvatar(
                backgroundColor: Colors.purpleAccent[700],
                radius: 10,
                child: Icon(
                  Icons.add,
                  size: 20,
                  color: Colors.white,
                )),
          )
        ],
      ),
      title: Text(
        "Status",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
      subtitle: Text(
        "Add status update",
        style: TextStyle(fontSize: 13, color: Colors.grey[900]),
      ),
    );
  }
}
