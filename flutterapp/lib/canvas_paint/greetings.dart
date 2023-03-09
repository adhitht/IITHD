import 'package:flutter/material.dart';
import 'package:iithd2/services/params.dart';

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = defaultColor
      ..strokeWidth = 8;

    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.375,
      size.height * 0.80,
      size.width * 0.55,
      size.height * 0.55,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.2,
      size.width,
      size.height * 0.35,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
