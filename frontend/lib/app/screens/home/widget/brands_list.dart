import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/providers/brands/brands_repository.dart';
import 'package:frontend/app/screens/home/widget/brand_card.dart';
import 'package:frontend/app/theme/constrants/colors.dart';

class BrandsList extends ConsumerWidget {
  const BrandsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brandsRef = ref.watch(brandsRepositoryProvider);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'POPULAR BRANDS',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.black,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          SizedBox(
            height: 80,
            // Brand list
            child: brandsRef.when(
              data: (brands) {
                return ListView.separated(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: brands.length,
                  itemBuilder: (BuildContext context, int index) {
                    return BrandCard(
                      brand: brands[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                );
              },
              error: (error, stackTrace) => const Center(
                child: Text('Getting error while getting brands'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
