import 'package:flutter/material.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final TextTheme lightTextTheme =
      GoogleFonts.poppinsTextTheme().copyWith(
    displayLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 33 / 22,
    ),
    displayMedium: GoogleFonts.bebasNeue(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 21 / 18,
    ),
    displaySmall: GoogleFonts.bebasNeue(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 21 / 18,
      color: AppColors.orange,
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      height: 27 / 16,
    ),
    headlineMedium: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 18 / 12,
        color: const Color(0xFF2D2D2D)),
    headlineSmall: GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 15 / 10,
        color: const Color(0xFF959595)),
    bodyLarge: GoogleFonts.bebasNeue(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
      height: 24 / 16,
    ),
    bodyMedium: GoogleFonts.nunito(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 19 / 14,
    ),
    bodySmall: GoogleFonts.urbanist(
      color: AppColors.gray,
      fontSize: 8,
      fontWeight: FontWeight.w500,
      height: 10 / 8,
      letterSpacing: 0.18,
    ),
  );
}
