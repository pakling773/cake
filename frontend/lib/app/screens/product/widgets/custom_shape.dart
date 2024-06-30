import 'package:flutter/material.dart';

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final height = size.height;
    final width = size.width;

    final Path path = Path();

    // Create a quadratic bezier curve to the center of the right side
    path.quadraticBezierTo(
        size.width * 0.5, // Control point (halfway horizontally)
        0, // Control point (top edge)
        size.width, // End point (right center horizontally)
        size.height * 0.8 // End point (center vertically)
        );

    // Continue the path to the bottom-right corner
    path.lineTo(size.width, size.height);

    // Continue the path to the bottom-left corner
    path.lineTo(0, size.height);

    // Close the path back to the starting point
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
