import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});
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
                'Mini Headline',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  // Popular
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Popular', style: textstyle),
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
                  // Trading
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Trading', style: textstyle),
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

                  // Today
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Today', style: textstyle),
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
