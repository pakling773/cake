import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class EditProfileMenu extends StatelessWidget {
  const EditProfileMenu({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
                onTap: () {
                  context.goNamed(AppRouterEnum.profile.name);
                },
                child: SvgPicture.asset(
                  'assets/icons/back_icon.svg',
                  width: 20,
                  height: 20,
                ))),
        Center(
          child: Text(
            'Edit Profile',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppColors.white,
                  height: 27 / 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ],
    );
  }
}
