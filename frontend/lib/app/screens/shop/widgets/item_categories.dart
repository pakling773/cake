import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';

class ItemCategories extends StatelessWidget {
  final int index;
  final int selectedCategory;
  final VoidCallback onTap;
  final Map<String, dynamic> category;

  const ItemCategories(
      {super.key,
      required this.index,
      required this.selectedCategory,
      required this.onTap,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 18),
        decoration: BoxDecoration(
            color: selectedCategory == index
                ? AppColors.white
                : const Color(0xffE9E9E9),
            border: Border.all(
              color: selectedCategory == index
                  ? AppColors.orange
                  : const Color(0xffE9E9E9),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            category['name'],
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: selectedCategory == index
                    ? AppColors.orange
                    : const Color(0xffA4A4A4)),
          ),
        ),
      ),
    );
  }
}
