import 'package:flutter/material.dart';
import 'package:frontend/app/screens/shop_form/widgets/shop_form.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class ShopFormScreen extends StatelessWidget {
  const ShopFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        titleSpacing: 0,
        centerTitle: false,
        title: Text(
          'Shop',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
      body: const ShopForm(),
    );
  }
}
