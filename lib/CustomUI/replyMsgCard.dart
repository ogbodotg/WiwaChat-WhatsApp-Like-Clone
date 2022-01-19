import 'package:flutter/material.dart';

class ReplyMessageCard extends StatelessWidget {
  const ReplyMessageCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 45,
          ),
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            // color: Colors.purple[200],
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  "This is the guest account reply message area.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text("time",
                    style: TextStyle(fontSize: 13, color: Colors.grey[600])),
              )
            ]),
          ),
        ));
  }
}
