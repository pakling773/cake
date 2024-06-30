import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';

class TopMenu extends ConsumerWidget {
  const TopMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(userProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello ',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                children: [
                  TextSpan(
                    text: user?.name ?? '',
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
            ),
            Row(
              children: [
                SvgPicture.asset('assets/icons/Location.svg'),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  'Wanchai Rd, Hong kong',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            )
          ],
        ),
        // ElevatedButton(
        //   onPressed: () {
        //     getCount(ref);
        //   },
        //   child: const Text('test'),
        // ),
        Row(
          children: [
            Material(
              child: InkWell(
                onTap: () {
                  context.pushNamed(AppRouterEnum.shopForm.name);
                },
                borderRadius: BorderRadius.circular(6),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.dark,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: SvgPicture.asset(
                    'assets/icons/shop_icon.svg',
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Material(
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: () {
                  context.pushNamed(AppRouterEnum.moodSelect.name);
                },
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.peru,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    BoxIcons.bx_wink_smile,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            )
          ],
        )
      ],
    );
  }
}
