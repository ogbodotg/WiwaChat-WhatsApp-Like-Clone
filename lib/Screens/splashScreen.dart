import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiwa_chat/Pages/loginPage.dart';
import 'package:wiwa_chat/Screens/UserScreen.dart';
import 'package:wiwa_chat/Screens/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Timer(Duration(seconds: 3), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (builder) => UserScreen()));
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Welcome to Wiwa Chat",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                Center(
                    child: Text(
                  'Wiwa Chat',
                  style: TextStyle(
                      fontFamily: 'Signatra',
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                )),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        ),
                        children: [
                          TextSpan(
                              text: "Agree to accept the",
                              style: TextStyle(color: Colors.grey[400])),
                          TextSpan(
                              text: " Wiwa Chat Terms & Conditions",
                              style: TextStyle(color: Colors.purple))
                        ]),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => LoginPage()),
                        (route) => false);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 110,
                    height: 50,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      elevation: 8,
                      color: Colors.purple,
                      child: Center(
                        child: Text("AGREE & CONTINUE",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
