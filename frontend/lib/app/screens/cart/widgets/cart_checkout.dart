import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/common/currency_extenstion.dart';
import 'package:frontend/app/models/cart/cart_model.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class CartCheckout extends ConsumerWidget {
  const CartCheckout({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CartModel> cartItems = ref.watch(cartProvider)!;

    final totalAmount = ref.watch(cartProvider.notifier).getTotal;

    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouterEnum.paymentScreen.name);
      },
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.peru,
          borderRadius: BorderRadius.circular(16),
        ),
        padding:
            const EdgeInsets.only(top: 18, right: 13, bottom: 18, left: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Text(
                'Checkout',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 16,
                      height: 18 / 16,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 31,
                height: 31,
                decoration: const BoxDecoration(
                  color: Color(0xff323232),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    // Added Item Number
                    cartItems.length.toString(),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                decoration: BoxDecoration(
                  color: const Color(0xff323232),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  // Totle Price
                  totalAmount.cEnFormat,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 16,
                        height: 18 / 16,
                        color: AppColors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
