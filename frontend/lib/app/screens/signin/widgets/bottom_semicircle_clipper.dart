import 'package:flutter/material.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class BottomSemicircleClipper extends StatelessWidget {
  const BottomSemicircleClipper({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SemicircleClipper(),
      child: Container(
        height: 130,
        width: double.infinity,
        color: AppColors.orange,
      ),
    );
  }
}

class SemicircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    // path.moveTo(0, size.height);
    // path.quadraticBezierTo(
    //   size.width / 2,
    //   0,
    //   size.width,
    //   size.height,
    // );
    // path.close();

    path.lineTo(0, size.height); // Start from the top-left corner
    path.quadraticBezierTo(size.width / 2, 0, size.width,
        size.height); // Curve to the top-right corner
    path.lineTo(
        size.width, size.height); // Draw line to the bottom-right corner
    path.lineTo(0,
        size.height); // Draw line to the bottom-left corner to close the path

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
