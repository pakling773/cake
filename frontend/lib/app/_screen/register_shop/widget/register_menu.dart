import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/screens/shop_form/widgets/wave_shape.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class RegisterMenu extends StatelessWidget {
  const RegisterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: AppColors.peru,
          child: Row(
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/angle-left-solid.svg',
                  width: 20,
                  height: 20,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Register your shop',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        ClipPath(
          clipper: WaveShape(),
          child: Container(
            color: AppColors.peru,
            height: 45,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    );
  }
}
