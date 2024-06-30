import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:localstorage/localstorage.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId: 'your-client_id.apps.googleusercontent.com',

    );

class Preferences extends ConsumerStatefulWidget {
  const Preferences({super.key});

  @override
  ConsumerState<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends ConsumerState<Preferences> {
  //
  logout(context) async {
    final logout = await _googleSignIn.signOut();
    ref.read(userProvider.notifier).removeUser();
    localStorage.clear();
    FirebaseAuth.instance.signOut();
    GoRouter.of(context).goNamed(AppRouterEnum.signIn.name);
  }

  @override
  Widget build(BuildContext context) {
    final shop = ref.watch(shopProvider);

    final textstyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.w600,
        );
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: const Color(0xffE2E2E2),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Preferences',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.goNamed(AppRouterEnum.shopForm.name);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/heart-regular.svg',
                              width: 14,
                              height: 14,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                                (shop != null)
                                    ? 'Manage ${shop.name}'
                                    : " Create New Shop",
                                style: textstyle),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/right_arrow.svg',
                        width: 14,
                        height: 14,
                      ),
                    ],
                  ),
                  if ((shop != null)) ...[
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(AppRouterEnum.manageCakes.name);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/heart-regular.svg',
                                width: 14,
                                height: 14,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Manage Cakes',
                                style: textstyle,
                              ),
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/right_arrow.svg',
                          width: 14,
                          height: 14,
                        ),
                      ],
                    )
                  ],
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/moon.svg',
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text('Darkmode', style: textstyle),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/icons/right_arrow.svg',
                        width: 14,
                        height: 14,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          logout(context);
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/wifi.svg',
                              width: 14,
                              height: 14,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Sign Out', style: textstyle),
                          ],
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/right_arrow.svg',
                        width: 14,
                        height: 14,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
