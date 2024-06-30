import 'package:flutter/material.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:go_router/go_router.dart';

class SignupBottomtext extends StatefulWidget {
  const SignupBottomtext({super.key});

  @override
  State<SignupBottomtext> createState() => _SignupBottomtext();
}

class _SignupBottomtext extends State<SignupBottomtext> {
  late TapGestureRecognizer tapGestureRecognizer;

  @override
  void initState() {
    super.initState();

    tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        context.goNamed(AppRouterEnum.signIn.name);
      };
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: 12, color: AppColors.black),
          children: <TextSpan>[
            const TextSpan(text: 'Already have an account? '),
            TextSpan(
              recognizer: tapGestureRecognizer,
              text: 'Sign in',
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
