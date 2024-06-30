import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartAdd extends StatelessWidget {
  CartAdd({super.key, required this.cake, required this.onAddToCart});
  Function onAddToCart;
  CakeModel cake;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(right: 20, bottom: 25, left: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: GoogleFonts.roboto(
                  color: const Color(0xff979696),
                  fontSize: 18,
                  height: 21 / 18,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.none,
                ),
              ),

              // Item Price
              Text(
                '\$${cake.price}',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      height: 27 / 18,
                      color: AppColors.orange,
                    ),
              ),
            ],
          ),

          // ADD To Cart Button
          GestureDetector(
            onTap: () => onAddToCart(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.peru,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  'Add to Cart',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        height: 27 / 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
