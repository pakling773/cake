import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/models/cart/cart_model.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ShoppingCart extends ConsumerStatefulWidget {
  // int itemCount;
  CartModel cart;
  int index;

  // final VoidCallback onRemove;
  // final Function onAddToFav;

  ShoppingCart({
    super.key,
    required this.cart,
    required this.index,
    // required this.onAddToFav,
  });

  @override
  ConsumerState createState() => _ShoppingCart();
}

class _ShoppingCart extends ConsumerState<ShoppingCart> {
  @override
  // late double updatedPrice;

  // @override
  // void initState() {
  //   super.initState();
  //   // updatedPrice = widget.cart.cake.price.toDouble();
  // }

  void _decrement() {
    ref.read(cartProvider.notifier).decrement(widget.index);
  }

  void _increment() {
    ref.read(cartProvider.notifier).increment(widget.index);
  }

  void _remove() {
    ref.read(cartProvider.notifier).remove(widget.index);

    toastification.show(
      context: context,
      style: ToastificationStyle.simple,
      title: const Text('Remove Item From Cart SuccessFully!'),
      alignment: Alignment.topCenter,
      autoCloseDuration: const Duration(seconds: 4),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      borderRadius: BorderRadius.circular(24.0),
      boxShadow: highModeShadow,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        context.push(AppRouterEnum.itemDetail.path, extra: widget.cart.cake)
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.15),
                  offset: const Offset(0, 0),
                  blurRadius: 30,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      // Cart Item thumbnail
                      child: AppImage(
                        widget.cart.cake.photo,
                        height: 104,
                        width: 104,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Selected favourite Item
                  ],
                ),
                const SizedBox(
                  width: 22,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 16, bottom: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // Item name
                                  widget.cart.cake.name ?? '',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),

                                //quanitty
                                Text(
                                  '${widget.cart.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(color: AppColors.gray),
                                ),
                              ],
                            ),

                            // Remove Button
                            GestureDetector(
                              onTap: _remove,
                              child: SvgPicture.asset(
                                'assets/icons/cart/delete.svg',
                                width: 24,
                                height: 24,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Decrease Item Button
                                ///
                                GestureDetector(
                                  onTap: _decrement,
                                  child: Container(
                                    width: 36,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffEAEAEA)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff7B7B7B)
                                              .withOpacity(0.25),
                                          offset: const Offset(0, 4),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/cart/minus.svg',
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 28,
                                ),
                                // Item Number
                                //

                                SizedBox(
                                  width: 15,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      widget.cart.quantity.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                              color: Colors.black,
                                              fontSize: 24,
                                              height: 28 / 24,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 28,
                                ),
                                // Increase Item Button
                                // Decrease Item Button

                                GestureDetector(
                                  onTap: _increment,
                                  child: Container(
                                    width: 36,
                                    height: 34,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: const Color(0xffEAEAEA)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xff7B7B7B)
                                              .withOpacity(0.25),
                                          offset: const Offset(0, 4),
                                          blurRadius: 10,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/icons/cart/plus.svg',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            // Item Price
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '\$${widget.cart.total}',
                                  textAlign: TextAlign.end,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        color: AppColors.orange,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
