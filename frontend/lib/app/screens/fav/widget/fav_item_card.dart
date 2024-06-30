import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class FavItemCard extends ConsumerWidget {
  FavItemCard({super.key, required this.cake});

  CakeModel cake;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => {context.push(AppRouterEnum.itemDetail.path, extra: cake)},
      child: Container(
        width: double.maxFinite,
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
        child: IntrinsicHeight(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: AppImage(cake.photo,
                    height: 68, width: 68, fit: BoxFit.cover),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  cake.name!,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              // SvgPicture.asset('assets/icons/location_icon.svg'),
                              Text(
                                '\$${cake.price}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    // ! Heart Icon
                    GestureDetector(
                      onTap: () =>
                          ref.read(cakeProvider.notifier).addToFav(cake),
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(2),
                        width: 22,
                        height: 22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black12,
                        ),
                        child: SvgPicture.asset(
                            'assets/icons/${(cake.isFav == true) ? 'red_heart.svg' : 'heart.svg'}'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
