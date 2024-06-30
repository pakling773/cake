import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSize extends StatelessWidget {
  final int index;
  final int selectedSize;
  final VoidCallback onTap;
  ItemSize(
      {super.key,
      required this.index,
      required this.selectedSize,
      required this.onTap,
      required this.size});

  String size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 68,
        height: 32,
        decoration: BoxDecoration(
          color: selectedSize == index ? AppColors.peru : AppColors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: selectedSize == index
                ? AppColors.peru
                : const Color(0xff6E7489),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: GoogleFonts.nunito(
              fontSize: 12,
              height: 18 / 12,
              fontWeight: FontWeight.w600,
              color: selectedSize == index
                  ? AppColors.white
                  : const Color(0xff1A1D26),
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
