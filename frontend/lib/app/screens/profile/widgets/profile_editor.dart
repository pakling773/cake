import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileEditor extends StatelessWidget {
  const ProfileEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: AppColors.peru,
            height: 100,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/boy.jpg',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {
                    context.goNamed(AppRouterEnum.editProfile.name);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xff323232),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'Edit Profile',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 14,
                                height: 16 / 14,
                                color: AppColors.white,
                              ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
