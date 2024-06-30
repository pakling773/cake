import 'package:flutter/material.dart';

class WaveShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    final Path path = Path();

// Move the path to the bottom left corner of the widget
    path.lineTo(0, height * 0.70);

// Draw a quadratic bezier curve from the bottom left to the middle
// The control point is moved higher for a more pronounced curve
    path.quadraticBezierTo(
        width * 0.25, height * 0.25, width * 0.5, height * 0.75);

// Draw another quadratic bezier curve from the middle to the bottom right
// The control point is moved higher for a more pronounced curve
    path.quadraticBezierTo(width * 0.75, height * 1.25, width, height * 0.75);

// Draw a line from the bottom right corner to the top right corner
    path.lineTo(width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
