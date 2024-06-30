import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/common/currency_extenstion.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:toastification/toastification.dart';

class ProductCard extends ConsumerWidget {
  final CakeModel item;
  final double? width;
  final VoidCallback? onTap;
  final int? index;
  final Widget? actionIcon;
  const ProductCard({
    super.key,
    required this.item,
    this.onTap,
    this.width,
    this.index,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap ??
          () => context.pushNamed(AppRouterEnum.itemDetail.name, extra: item),
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 230,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 30,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Thumbnail
                Expanded(
                  child: AppImage(
                    item.photo,
                    width: double.maxFinite,
                    // height: 157,
                    fit: BoxFit.cover,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, right: 6, bottom: 8, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Item Name
                      Text(
                        item.name!,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Item Price
                          Text(
                            item.price.cEnFormat,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColors.orange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                          ),

                          //  Add Button
                          actionIcon ??
                              SizedBox(
                                width: 28,
                                height: 28,
                                child: ElevatedButton(
                                  onPressed: () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .addToCart(item);

                                    toastification.show(
                                      context: context,
                                      style: ToastificationStyle.simple,
                                      title: const Text(
                                          'Add Item To Cart SuccessFully!'),
                                      alignment: Alignment.topCenter,
                                      autoCloseDuration:
                                          const Duration(seconds: 4),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      borderRadius: BorderRadius.circular(24.0),
                                      boxShadow: highModeShadow,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    padding: const EdgeInsets.all(0),
                                    backgroundColor: AppColors.peru,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/add.svg',
                                  ),
                                ),
                              )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),

            //  Favorite
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  ref.read(cakeProvider.notifier).addToFav(item);
                  toastification.show(
                    context: context,
                    style: ToastificationStyle.simple,
                    title: item.isFav == false
                        ? const Text('Add Item To Favorite SuccessFully!')
                        : const Text('Remove Item From Favorite SuccessFully!'),
                    alignment: Alignment.topCenter,
                    autoCloseDuration: const Duration(seconds: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    borderRadius: BorderRadius.circular(24.0),
                    boxShadow: highModeShadow,
                  );
                },
                child: Container(
                  padding: const EdgeInsetsDirectional.all(2),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white.withOpacity(0.5),
                  ),
                  child: SvgPicture.asset(
                      'assets/icons/${(item.isFav == true) ? 'red_heart.svg' : 'heart.svg'}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
