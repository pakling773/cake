import 'package:flutter/material.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/screens/cart/widgets/shopping_cart_list.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Shopping Cart',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.dark,
                height: 27 / 18,
              ),
        ),
        actions: [
          Transform.translate(
            offset: const Offset(-8, 0),
            child: IconButton(
              onPressed: () {
                ref.read(cartProvider.notifier).clearAll();

                toastification.show(
                  context: context,
                  style: ToastificationStyle.simple,
                  title: const Text('Clear All Items From Cart SuccessFully!'),
                  alignment: Alignment.topCenter,
                  autoCloseDuration: const Duration(seconds: 4),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  borderRadius: BorderRadius.circular(24.0),
                  boxShadow: highModeShadow,
                );
              },
              icon: Text(
                'Clear all',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 12,
                      color: AppColors.red,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.only(bottom: 14 + MediaQuery.of(context).padding.bottom),
        child: const Column(
          children: [
            // Shopping Card list  component
            Expanded(
              child: ShoppingCartList(),
            ),

            // Cart Checkout  component
          ],
        ),
      ),
    );
  }
}
