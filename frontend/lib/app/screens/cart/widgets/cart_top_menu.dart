import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';

class CartTopMenu extends ConsumerWidget {
  const CartTopMenu({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.dark,
                height: 27 / 18,
              ),
        ),
        InkWell(
          onTap: () => ref.read(cartProvider.notifier).clearAll(),
          child: Text(
            'Clear all',
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColors.red),
          ),
        ),
      ],
    );
  }
}
