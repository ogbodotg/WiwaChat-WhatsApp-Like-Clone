import 'dart:math';

import 'package:flutter/material.dart';

class OtherStatus extends StatelessWidget {
  const OtherStatus(
      {Key key,
      this.name,
      this.time,
      this.image,
      this.viewedStatus,
      this.statusCount})
      : super(key: key);
  final String name;
  final String time;
  final String image;
  final bool viewedStatus;
  final int statusCount;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusCountPaint(
          viewedStatus: viewedStatus,
          statusCount: statusCount,
        ),
        child: CircleAvatar(
          radius: 26,
          // backgroundImage: AssetImage(image),
          child: Icon(Icons.person),
        ),
      ),
      title: Text(name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          )),
      subtitle: Text("Today at, $time",
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 13,
          )),
    );
  }
}

convertDegreeToAngle(double degree) {
  return degree * pi / 180;
}

class StatusCountPaint extends CustomPainter {
  bool viewedStatus;
  int statusCount;
  StatusCountPaint({this.viewedStatus, this.statusCount});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 6.0
      ..color = viewedStatus ? Colors.grey : Colors.purple
      ..style = PaintingStyle.stroke;
    drawArc(canvas, size, paint);
  }

  void drawArc(Canvas canvas, Size size, Paint paint) {
    if (statusCount == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          convertDegreeToAngle(0), convertDegreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusCount;
      for (int i = 0; i < statusCount; i++) {
        canvas.drawArc(
            Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            convertDegreeToAngle(degree + 4),
            convertDegreeToAngle(arc - 8),
            false,
            paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
