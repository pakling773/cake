import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailInfo extends StatelessWidget {
  DetailInfo({super.key, required this.cake});
  CakeModel cake;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Item Name
          if (cake.name != null)
            Text(
              cake.name!.toUpperCase(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 20,
                  height: 30 / 20,
                  color: const Color(0xff1A1D26)),
            ),
          // Row(
          //   children: [
          //     SvgPicture.asset('assets/icons/star.svg'),
          //     RichText(
          //       text: TextSpan(
          //         // Rating Number
          //         text: '4.9 ',
          //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //             fontSize: 12,
          //             height: 16 / 12,
          //             color: const Color(0xff1A1D26)),
          //         children: [
          //           TextSpan(
          //               text: '(102)',
          //               style: GoogleFonts.nunito(
          //                   fontSize: 12,
          //                   height: 16 / 12,
          //                   fontWeight: FontWeight.w400,
          //                   color: const Color(0xff6E7489))),
          //         ],
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 6,
          //     ),
          //     Text(
          //       'See reviews',
          //       style: GoogleFonts.nunito(
          //           fontSize: 12,
          //           height: 16 / 12,
          //           fontWeight: FontWeight.w700,
          //           color: const Color(0xffFE8160)),
          //     ),
          //   ],
          // ),

          const SizedBox(
            height: 19,
          ),

          // Description

          Text(
            (cake.description) ?? "",
            style: GoogleFonts.nunito(
                fontSize: 12,
                height: 16 / 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff1A1D26)),
          )
        ],
      ),
    );
  }
}
