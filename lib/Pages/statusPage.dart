import 'package:flutter/material.dart';
import 'package:wiwa_chat/CustomUI/StatusPage/newStatusCard.dart';
import 'package:wiwa_chat/CustomUI/StatusPage/otherStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 45,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.purple,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.purpleAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            NewStatusCard(),
            // Divider(),
            label("Recent updates"),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: false,
              statusCount: 1,
            ),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: false,
              statusCount: 11,
            ),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: false,
              statusCount: 5,
            ),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: false,
              statusCount: 1,
            ),
            SizedBox(height: 10),
            label("Viewed updates"),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: true,
              statusCount: 10,
            ),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: true,
              statusCount: 4,
            ),
            OtherStatus(
              name: "Ogbodo ThankGod",
              image: null,
              time: "12:10",
              viewedStatus: true,
              statusCount: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String text) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
