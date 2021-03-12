import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero_mobile/components/appLabelVote/drawingArea.dart';

class AppCustomPainter extends CustomPainter{
  List<DrawingArea> points;
  Color color;
  double height;
  double width;

  AppCustomPainter({
    @required this.color,
    @required this.points,
    @required this.height,
    @required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white.withOpacity(0.0);
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    canvas.drawRect(rect, background);

    for(int i = 0; i < points.length-1; i++) {
      if(points[i] != null && points[i+1] != null) {
        Paint paint = points[i].areaPaint;
        canvas.drawLine(points[i].point, points[i+1].point, paint);
      } else if (points[i] != null && points [i+1] == null) {
        Paint paint = points[i].areaPaint;
        canvas.drawPoints(PointMode.points, [points[i].point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}