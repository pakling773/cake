import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/providers/user_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:localstorage/localstorage.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool _tasksCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeApp();
      setState(() {
        _tasksCompleted = true;
        Future.delayed(const Duration(seconds: 5)).then(
          (value) {
            // context.replaceNamed(AppRouterEnum.home.name);
          },
        );
      });
    });
  }

  Future<void> _initializeApp() async {
    await Future.wait([
      ref.read(shopProvider.notifier).setShop(),
      ref.read(userProvider.notifier).setUserFromLocalStorage(),
      ref.read(cakeProvider.notifier).getCakes(),
    ] as Iterable<Future>);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    useEffect(() {
      final token = localStorage.getItem('accessToken');
      final uerId = localStorage.getItem('user_id');
      final user = FirebaseAuth.instance.currentUser;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (uerId != null) {
          context.goNamed(AppRouterEnum.home.name);
        } else {
          context.goNamed(AppRouterEnum.signIn.name);
        }
      });

      return null;
    }, []);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 22, top: 22),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF644334),
                Color(0xFFEADFCB),
              ],
              stops: [
                0.55,
                0.5
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Lets Chill',
                            style: textTheme.bodyMedium!.copyWith(
                              fontFamily: 'Poppins',
                              fontSize: 24,
                              color: AppColors.white,
                              fontWeight: FontWeight.w300,
                              height: 36 / 24,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'PAKLING CAKE',
                            style: textTheme.displayMedium!.copyWith(
                              fontSize: 48,
                              color: const Color(0xFFEECE83),
                              fontWeight: FontWeight.w400,
                              height: 57.6 / 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Image.asset(
                      'assets/images/splash-cake.png',
                      width: 250,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/arrow-right-long-icon.svg'),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            'Welcome ',
                            style: textTheme.displayMedium!.copyWith(
                              fontSize: 48,
                              color: const Color(0xFF004132),
                              fontWeight: FontWeight.w400,
                              height: 57.6 / 48,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              '© Powered by Pakling',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: const Color(0xFF644334),
                fontWeight: FontWeight.w400,
                height: 21 / 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
