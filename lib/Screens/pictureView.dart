import 'dart:io';

import 'package:flutter/material.dart';

class PictureView extends StatelessWidget {
  const PictureView({Key key, this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.crop_rotate, size: 28)),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions_outlined, size: 28)),
          IconButton(onPressed: () {}, icon: Icon(Icons.title, size: 28)),
          IconButton(onPressed: () {}, icon: Icon(Icons.edit, size: 28))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.add_photo_alternate,
                      color: Colors.white,
                      size: 27,
                    ),
                    suffixIcon: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.tealAccent[700],
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 27,
                      ),
                    ),
                    hintText: "Add caption!",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
