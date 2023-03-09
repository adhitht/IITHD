import 'package:flutter/material.dart';

class HamburgerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(size.width / 4, size.height * 0.35);
    path.lineTo(size.width * 3 / 4, size.height * 0.35);

    path.moveTo(size.width / 4, size.height * 0.5);
    path.lineTo(size.width * 3 / 4, size.height * 0.5);

    path.moveTo(size.width / 4, size.height * 0.65);
    path.lineTo(size.width * 3 / 4, size.height * 0.65);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
