import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/common/datetime_extenstion.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopCover extends StatelessWidget {
  ShopCover({super.key, required this.shop});

  ShopModel shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, right: 20, bottom: 16, left: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF262626).withOpacity(0.6),
            const Color.fromRGBO(4, 2, 5, 0),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Title
          Text(
            shop.name!,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColors.white),
          ),
          const SizedBox(
            height: 4,
          ),

          // Location
          // Row(
          //   children: [
          //     SvgPicture.asset('assets/icons/menu/location_icon.svg'),
          //     Text(
          //       '1.2 km .',
          //       style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          //           color: AppColors.white, fontWeight: FontWeight.w400),
          //     ),
          //     const SizedBox(
          //       width: 5,
          //     ),
          //     SvgPicture.asset('assets/icons/star.svg'),
          //     Text(
          //       '4.5 (342)',
          //       style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          //           color: AppColors.white, fontWeight: FontWeight.w400),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 6,
          ),

          Row(
            children: [
              Row(
                children: [
                  // SvgPicture.asset('assets/icons/menu/delivery_icon.svg'),
                  SvgPicture.asset(
                    'assets/icons/menu/circle_time.svg',
                    height: 14,
                    width: 14,
                  ),
                  const SizedBox(
                    width: 3.6,
                  ),
                  // Delivery Price
                  Text(
                    '${shop.openingHour.timeFormat} - ${shop.closeingHour.timeFormat}',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontFamily: 'Poppins',
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(
                    width: 200,
                  ),
                  GestureDetector(
                    onTap: () async {
                      var lat = shop.address1?.latitude;
                      var lng = shop.address1?.longitude;
                      print(lat);
                      print(lng);
                      String googleUrl =
                          'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

                      if (await canLaunchUrl(Uri.parse(googleUrl))) {
                        await launchUrl(Uri.parse(googleUrl));
                      } else {
                        throw 'Could not open the map.';
                      }

                      print('map');
                    },
                    child: const Icon(
                      Icons.maps_home_work,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
