import 'package:flutter/material.dart';
import 'dart:math' as math;

class Hexagon extends StatelessWidget {
  final double size;
  final Color color;
  final String text;
  final double angle;
 final String fntFamily;

  const Hexagon({
    super.key,
    required this.size,
    required this.color,
    required this.text,
    this.angle = 0,
    this.fntFamily="",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.rotate(
          angle: angle,
          child: CustomPaint(
            size: Size(size, size),
            painter: HexagonPainter(color: color),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          // top: size / 2 - 10,
          top: 0,
          bottom: 0,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.white,fontFamily: fntFamily),
            ),
          ),
        ),
      ],
    );
  }
}

class HexagonPainter extends CustomPainter {
  final Color color;

  HexagonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();

    var angle = (math.pi * 2) / 6;
    path.moveTo(
      size.width / 2 + radius * math.cos(0),
      size.height / 2 + radius * math.sin(0),
    );
    for (int i = 1; i <= 6; i++) {
      path.lineTo(
        size.width / 2 + radius * math.cos(angle * i),
        size.height / 2 + radius * math.sin(angle * i),
      );
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
