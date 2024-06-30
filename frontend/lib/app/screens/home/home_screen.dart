import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/common/custom_alert_popup.dart';
import 'package:frontend/app/providers/location_provider.dart';
import 'package:frontend/app/screens/home/widget/banner_carousel_slider.dart';
import 'package:frontend/app/screens/home/widget/brands_list.dart';
import 'package:frontend/app/screens/home/widget/recomendation_list.dart';
import 'package:frontend/app/screens/home/widget/shop_list.dart';
import 'package:frontend/app/screens/home/widget/top_menu.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    //
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkLocationAccess();
    });

    super.initState();
  }

  checkLocationAccess() async {
    final location = ref.watch(locationServiceProvider);

    bool serviceEnabled;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      await location.requestService();
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            color: AppColors.white,
            child: const SafeArea(child: TopMenu())),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10)
              .copyWith(bottom: MediaQuery.of(context).padding.bottom),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // hero  Caurosel Slider  Component
              BannerCarouselSlider(),
              SizedBox(
                height: 18,
              ),

              // Recomendation List  Component
              RecomendationList(), //
              SizedBox(
                height: 18,
              ),

              // Brand List Component
              BrandsList(),
              SizedBox(
                height: 18,
              ),

              // Shop Card Component
              ShopList(),
            ],
          )),
    );
  }
}
