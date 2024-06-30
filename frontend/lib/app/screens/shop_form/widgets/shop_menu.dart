import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class ShopMenu extends StatelessWidget {
  const ShopMenu({super.key});

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
                onTap: () {
                  context.goNamed(AppRouterEnum.profile.name);
                },
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
                  'SHOP',
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
      ],
    );
  }
}
