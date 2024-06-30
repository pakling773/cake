import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/app/providers/cake/manage_cakes_provider.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/product_card.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';

class ManageCakesScreen extends HookConsumerWidget {
  const ManageCakesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shop = ref.watch(shopProvider);

    useEffect(() {
      if (shop != null) {
        Future.microtask(
          () {
            ref.read(manageCakesProvider.notifier).getCakesByShopId(shop.id!);
          },
        );
      }
      return null;
    }, [shop]);

    final cakesState = ref.watch(manageCakesProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        titleSpacing: 0,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(
          'Manage Cakes',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
        centerTitle: false,
        actions: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(AppRouterEnum.manageCakesForm.name);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: AppColors.peru,
              ),
              child: SvgPicture.asset(
                'assets/icons/add.svg',
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.white.withOpacity(0.0),
        child: RefreshIndicator(
          backgroundColor: AppColors.white,
          onRefresh: () async {
            if (shop != null) {
              await ref
                  .read(manageCakesProvider.notifier)
                  .getCakesByShopId(shop.id!);
            }
          },
          child: cakesState.when(
            data: (cakes) {
              return cakes != null && cakes.isNotEmpty
                  ? GridView.builder(
                      padding: const EdgeInsets.all(20).copyWith(bottom: 30),
                      itemCount: cakes.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductCard(
                          item: cakes[index],
                          onTap: () {
                            context.pushNamed(
                              AppRouterEnum.manageCakesForm.name,
                              queryParameters: {
                                'id': cakes[index].id,
                              },
                            );
                          },
                          actionIcon: SizedBox(
                            width: 28,
                            height: 28,
                            child: ElevatedButton(
                              onPressed: () async {
                                await ref
                                    .read(manageCakesProvider.notifier)
                                    .deleteCakeId(cakes[index].id!);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(0),
                                backgroundColor: AppColors.red,
                              ),
                              child: const Icon(
                                HeroIcons.trash,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No Cakes Found For ${shop?.name}'),
                    );
            },
            error: (error, stackTrace) => const Center(
              child: Text('Failed to get cakes!'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
