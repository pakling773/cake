import 'package:flutter/material.dart';
import 'package:frontend/app/screens/product/product_form.dart';

import 'package:frontend/app/screens/product/widgets/product_top_menu.dart';

import 'package:frontend/app/theme/constrants/colors.dart';

class ProductFormScreen extends StatelessWidget {
  const ProductFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(child: ProductTopMenu()),
      ),
      body: Container(
        color: AppColors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProductForm(),
            ],
          ),
        ),
      ),
    );
  }
}
