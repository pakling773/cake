import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/models/banners/banner_model.dart';
import 'package:frontend/app/providers/banners/banner_repository.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/screens/@shared_widgets/margin_widget.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class BannerCarouselSlider extends ConsumerWidget {
  const BannerCarouselSlider({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    final bannersRef = ref.watch(bannersRepositoryProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: bannersRef.when(
        data: (banners) {
          return CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder: (BuildContext context, int index, int pageViewIndex) =>
                BannerCarouselItem(
              banner: banners[index],
            ),
            options: CarouselOptions(
              height: 150,
              enlargeCenterPage: false,
              autoPlay: true,
              enableInfiniteScroll: false,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 4),
              autoPlayAnimationDuration: const Duration(milliseconds: 600),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 1,
            ),
          );
        },
        error: (error, stackTrace) => const Center(
          child: Text('Getting error while getting banners'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}

class BannerCarouselItem extends StatelessWidget {
  const BannerCarouselItem({super.key, required this.banner});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Margin(
      horizontal: -5,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(children: [
            AppImage(
              banner.photo,
              width: double.maxFinite,
              height: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.black54, Colors.transparent],
                  stops: [0, 1],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
                child: Text(
                  banner.name ?? '',
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
