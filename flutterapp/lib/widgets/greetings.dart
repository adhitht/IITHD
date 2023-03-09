import 'package:flutter/material.dart';
import 'package:iithd2/services/params.dart';
import 'package:iithd2/canvas_paint/greetings.dart';

String greeting() {
  return hour < 12
      ? "Good Morning "
      : hour < 16
          ? "Good Afternoon"
          : "Good Evening";
}

class Greetings extends StatelessWidget {
  const Greetings({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      width: double.infinity,
      child: CustomPaint(
        painter: LinePainter(),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 80,
              left: 25,
              child: Text(greeting(),
                  style: const TextStyle(
                      fontFamily: "Fredoka",
                      fontWeight: FontWeight.w600,
                      fontSize: 28,
                      color: Colors.white)),
            ),
            Positioned(
              top: 120,
              left: 25,
              child: Text(name,
                  style: const TextStyle(
                      fontFamily: "Fredoka",
                      fontWeight: FontWeight.w600,
                      fontSize: 34,
                      color: Colors.white)),
            ),
            Positioned(
              top: 130,
              right: 30,
              child: Image.asset(
                scale: 0.8,
                "assets/images/logo.png",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
