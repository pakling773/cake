import 'package:flutter/material.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';

class SigninBotttomtext extends StatefulWidget {
  const SigninBotttomtext({super.key});

  @override
  State<SigninBotttomtext> createState() => _SigninBotttomtext();
}

class _SigninBotttomtext extends State<SigninBotttomtext> {
  late TapGestureRecognizer tapGestureRecognizer;

  @override
  void initState() {
    super.initState();

    tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.goNamed(AppRouterEnum.singUp.name);
      };
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 12,
                color: AppColors.black,
              ),
          children: <TextSpan>[
            const TextSpan(text: 'Don\'t have an account? '),
            TextSpan(
              recognizer: tapGestureRecognizer,
              text: 'Sign up',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
