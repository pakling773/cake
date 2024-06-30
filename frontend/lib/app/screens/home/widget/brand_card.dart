import 'package:flutter/material.dart';
import 'package:frontend/app/models/brands/brands_model.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 30,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: AppImage(
          brand.photo ?? 'assets/images/no-image.jpg',
          width: double.maxFinite,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
