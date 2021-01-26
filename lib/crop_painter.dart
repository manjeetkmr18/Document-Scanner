import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CropPainter extends CustomPainter {
  Offset tl, tr, bl, br;
  CropPainter(this.tl, this.tr, this.bl, this.br);

  Paint painter1 = Paint()
    ..color = Colors.green
    ..strokeWidth = 3
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paintCircle = Paint()..color = Colors.black;

    Paint paintBorder = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Paint painter = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    canvas.drawLine(tl, tr, painter1);
    canvas.drawLine(tr, br, painter1);
    canvas.drawLine(br, bl, painter1);
    canvas.drawLine(bl, tl, painter1);

    canvas.drawCircle(tl, 10, painter);
    canvas.drawCircle(tr, 10, painter);
    canvas.drawCircle(bl, 10, painter);
    canvas.drawCircle(br, 10, painter);

    canvas.drawCircle(tl, 10, paintBorder);
    canvas.drawCircle(tr, 10, paintBorder);
    canvas.drawCircle(bl, 10, paintBorder);
    canvas.drawCircle(br, 10, paintBorder);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
