import 'package:flutter/material.dart';
import 'package:frontend/app/common/currency_extenstion.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MemberCard extends ConsumerWidget {
  const MemberCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final user = ref.watch(userProvider);
    print(user);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 343),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Stack(
            children: [
              Container(
                height: 185,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: const Alignment(-1.0, -0.55),
                    end: const Alignment(1.0, 0.55),
                    colors: [
                      const Color(0xFFFF94A1),
                      const Color(0xFFFF2C6B).withOpacity(0.7),
                    ],
                    stops: const [-0.2451, 1.7254],
                  ),
                ),
              ),
              // Positioned.fill(
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20),
              //     child: BackdropFilter(
              //       filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              //       child: Container(
              //         color: const Color.fromRGBO(255, 255, 255, 0.03),
              //       ),
              //     ),
              //   ),
              // ),
              const Positioned.fill(
                child: AppImage(
                  'assets/icons/profile-card-bg-effect.svg',
                  height: 185,
                ),
              ),
            ],
          ),
          Container(
            height: 185,
            padding: const EdgeInsets.symmetric(horizontal: 24)
                .copyWith(top: 17, bottom: 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Member Card',
                      style: textTheme.bodyLarge!.copyWith(
                        fontFamily: 'Poppins',
                        color: AppColors.white,
                        height: 24 / 16,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        user?.name ?? '',
                        maxLines: 1,
                        textAlign: TextAlign.end,
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: 32,
                          color: AppColors.white,
                          height: 38.4 / 32,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            user?.name ?? '',
                            maxLines: 1,
                            style: textTheme.bodyLarge!.copyWith(
                              fontFamily: 'Poppins',
                              color: AppColors.white,
                              height: 24 / 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            '****${user?.id.toString().substring(user.id.length - 6)}',
                            style: textTheme.bodyLarge!.copyWith(
                              fontFamily: 'Poppins',
                              color: AppColors.white,
                              height: 24 / 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: (user?.points) != null
                                ? user?.points.toString()
                                : '0'),
                        TextSpan(
                          text: ' Points',
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            color: AppColors.white,
                            fontWeight: FontWeight.w400,
                            height: 16.8 / 14,
                          ),
                        ),
                      ]),
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: 32,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        height: 38.4 / 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
