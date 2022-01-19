import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiwa_chat/Screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => HomeScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Text(
          'Wiwa Chat',
          style: TextStyle(
              fontFamily: 'Signatra',
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        )));
  }
}
