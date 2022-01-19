import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wiwa_chat/Screens/cameraScreen.dart';
import 'package:wiwa_chat/Screens/homeScreen.dart';
import 'package:wiwa_chat/Screens/splashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
