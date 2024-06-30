import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class SignUpMenu extends StatelessWidget {
  const SignUpMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final height = screenWidth > 600 ? screenWidth * 0.73 : screenWidth * 0.79;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -screenWidth * 0.62,
          left: -screenWidth * 0.28,
          child: ClipOval(
            child: Container(
              color: AppColors.orange,
              width: screenWidth * 0.8,
              height: height,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: GestureDetector(
            onTap: () {
              context.goNamed(AppRouterEnum.signIn.name);
            },
            child: SvgPicture.asset(
              'assets/icons/angle-left-solid.svg',
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
