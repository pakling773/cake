import 'package:flutter/material.dart';
import 'package:frontend/app/_screen/register_shop/widget/register_menu.dart';
// import 'package:frontend/app/_screen/register_shop/widget/register_shop_form.dart';
// import 'package:frontend/app/screens/registerShop_Screen/widgets/register_menu.dart';
// import 'package:frontend/app/screens/registerShop_Screen/widgets/register_shop_form.dart';
import 'package:frontend/app/screens/signin/widgets/bottom_semicircle_clipper.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class RegisterShopScreen extends StatelessWidget {
  const RegisterShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: SafeArea(child: RegisterMenu()),
        ),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const SingleChildScrollView(
                      child: Text('regisere shop was here')),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomSemicircleClipper(),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 150),
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          color: AppColors.peru,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Center(
                          child: Text(
                            'Register',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 15,
                                  height: 16 / 15,
                                  color: AppColors.white,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
