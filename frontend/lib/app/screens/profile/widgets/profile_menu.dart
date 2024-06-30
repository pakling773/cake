import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class ProfileMenu extends ConsumerWidget {
  const ProfileMenu({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);

    return RichText(
      text: TextSpan(
        text: 'Hello ',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
        children: [
          TextSpan(
            text: (user?.name != null) ? user?.name : " User",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppColors.orange,
                  fontWeight: FontWeight.w700,
                ),
          ),
          TextSpan(
            text: '!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}
