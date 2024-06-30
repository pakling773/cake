import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/common/datetime_extenstion.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class ShopCard extends ConsumerWidget {
  ShopCard({super.key, required this.shop});

  ShopModel shop;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => {
        // context.goNamed(
        //   AppRouterEnum.shopDetail.name,
        //   pathParameters: {'id': '2'},
        // )

        context.push(AppRouterEnum.shopDetail.path, extra: shop.id!)
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF000000).withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 28,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: AppImage(
                shop.logo,
                height: 68,
                width: 68,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name!,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(overflow: TextOverflow.ellipsis),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      if (shop.distance != null) ...[
                        SvgPicture.asset('assets/icons/location_icon.svg'),
                        Text(
                          '${shop.distance} km ',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                      // SvgPicture.asset('assets/icons/star.svg'),
                      // Text(
                      //   '4.5 (342)',
                      //   style: Theme.of(context).textTheme.headlineSmall,
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      // Row(
                      //   children: [
                      //     SvgPicture.asset('assets/icons/delivery.svg'),
                      //     const SizedBox(
                      //       width: 2,
                      //     ),
                      //     Text(
                      //       '\$5.00 . ',
                      //       style: Theme.of(context).textTheme.headlineSmall,
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/time_circle.svg'),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${shop.openingHour.timeFormat} - ${shop.closeingHour.timeFormat}',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
          ],
        ),
      ),
    );
  }
}
