import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Content extends StatelessWidget {
  const Content({super.key});
  @override
  Widget build(BuildContext context) {
    final textstyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w600,
        );
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xffE2E2E2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Content',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/heart-regular.svg',
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Favourite', style: textstyle),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/right_arrow.svg',
                        width: 14,
                        height: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/download.svg',
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Download', style: textstyle),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/right_arrow.svg',
                        width: 14,
                        height: 14,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
