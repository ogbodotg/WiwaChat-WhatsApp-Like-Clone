import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wiwa_chat/Screens/pictureView.dart';
import 'package:wiwa_chat/Screens/videoViewPage.dart';

List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController _cameraController;
  Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool cameraFlip = false;
  double rotateCamera = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: CameraPreview(_cameraController));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
                color: Colors.black,
                padding: EdgeInsets.only(
                  top: 5,
                  bottom: 5,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                flash = !flash;
                              });
                              flash
                                  ? _cameraController
                                      .setFlashMode(FlashMode.torch)
                                  : _cameraController
                                      .setFlashMode(FlashMode.off);
                            },
                            icon: Icon(flash ? Icons.flash_on : Icons.flash_off,
                                color: Colors.white, size: 28)),
                        GestureDetector(
                          onLongPress: () async {
                            await _cameraController.startVideoRecording();
                            setState(() {
                              isRecording = true;
                            });
                          },
                          onLongPressUp: () async {
                            XFile videoPath =
                                await _cameraController.stopVideoRecording();
                            setState(() {
                              isRecording = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        VideoViewPage(path: videoPath.path)));
                          },
                          onTap: () {
                            if (!isRecording) takePicture(context);
                          },
                          child: isRecording
                              ? Icon(
                                  Icons.radio_button_on,
                                  color: Colors.red,
                                  size: 60,
                                )
                              : Icon(Icons.panorama_fish_eye,
                                  color: Colors.white, size: 60),
                        ),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                cameraFlip = !cameraFlip;
                                rotateCamera = rotateCamera + pi;
                              });
                              int cameraPosition = !cameraFlip ? 0 : 1;
                              _cameraController = CameraController(
                                  cameras[cameraPosition],
                                  ResolutionPreset.high);
                              cameraValue = _cameraController.initialize();
                            },
                            icon: Transform.rotate(
                              angle: rotateCamera,
                              child: Icon(Icons.flip_camera_ios,
                                  color: Colors.white, size: 28),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hold for video, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }

  void takePicture(BuildContext context) async {
    // final path =
    //     join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    XFile path = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) => PictureView(
                  path: path.path,
                )));
  }
}
