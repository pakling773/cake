import 'package:frontend/app/screens/signin/widgets/bottom_semicircle_clipper.dart';
import 'package:frontend/app/screens/signup/widgets/sign_up_menu.dart';
import 'package:frontend/app/screens/signup/widgets/signup_bottomtext.dart';
import 'package:frontend/app/screens/signup/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
            height: 100,
            // color: AppColors.peru,
            child: const SafeArea(child: SignUpMenu())),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Container(
                // color: AppColors.peru,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create  \n Account',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: AppColors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SignUpForm(),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    )),

                    const Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BottomSemicircleClipper(), // Semi Circle Component
                    ),

                    const Positioned(
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: SignupBottomtext()), // Bottom text Compontent
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
