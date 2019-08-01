import 'dart:math';
import 'package:flutter/material.dart';

class TabPainter extends CustomPainter {
  Paint painter;
  PageController controller;
      
  TabPainter({this.controller}) {
    painter = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    int padding = 5;
    double width = size.width;
    double height = size.height;
    double halfHeight = height / 2;
    double radius = halfHeight - padding;

    print('${width}, ${height}');

    double fullExtend = controller.position.maxScrollExtent - controller.position.minScrollExtent;
    double pageOffset = controller.position.extentBefore / fullExtend;

    Offset start = Offset(halfHeight, halfHeight);
    Offset end = Offset(width / 2 - halfHeight, halfHeight);

    Path path = Path();
    path.addArc(
      Rect.fromCircle(center: start, radius: radius), pi / 2 , pi
    );
    path.addRect(
      Rect.fromLTWH(halfHeight, padding.toDouble(), end.dx - halfHeight, radius * 2)
    );
    path.addArc(
      Rect.fromCircle(center: end, radius: radius), pi * (3/2) , pi
    );

    canvas.translate(width / 2 * pageOffset, 0);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}