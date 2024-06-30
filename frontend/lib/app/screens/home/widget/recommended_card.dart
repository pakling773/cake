import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class RecommendedCard extends StatelessWidget {
  final CakeModel item;
  final bool favourite;
  final VoidCallback onFavoriteToggle;

  const RecommendedCard(
      {super.key,
      required this.item,
      required this.favourite,
      required this.onFavoriteToggle});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      clipBehavior: Clip.antiAlias,
      height: 230,
      width: 157,
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
              AppImage(
                item.photo,
                height: 157,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, right: 6, bottom: 8, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? '',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.price.toString(),
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: ElevatedButton(
                            onPressed: () {},
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
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsetsDirectional.all(2),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white.withOpacity(0.5),
              ),
              child: GestureDetector(
                onTap: onFavoriteToggle,
                child: SvgPicture.asset(
                  'assets/icons/${favourite ? 'red_heart.svg' : 'heart.svg'}',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
