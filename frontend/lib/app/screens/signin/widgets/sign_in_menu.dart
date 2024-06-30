import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInMenu extends StatelessWidget {
  const SignInMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final height = screenWidth > 600
        ? -MediaQuery.of(context).size.height * 0.92
        : -MediaQuery.of(context).size.height * 0.2;
    double left = screenWidth > 600 ? -150 : -60;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: height,
          right: -20,
          child: ClipOval(
            child: Container(
              color: AppColors.orange,
              width: MediaQuery.of(context).size.width * 0.9,
              height: screenWidth > 600
                  ? MediaQuery.of(context).size.width * 0.7
                  : MediaQuery.of(context).size.width * 0.79,
            ),
          ),
        ),
        Positioned(
          top: height,
          left: left,
          child: ClipOval(
            child: Container(
              color: AppColors.peru,
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.75,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 20,
          child: SvgPicture.asset(
            'assets/icons/angle-left-solid.svg',
            width: 20,
            height: 20,
          ),
        ),
        Positioned(
          top: 47,
          left: 20,
          child: Text(
            'Welcome \n Back',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                color: AppColors.white, fontSize: 28, height: 32 / 28),
          ),
        ),
      ],
    );
  }
}
