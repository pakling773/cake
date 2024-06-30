import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/fav/widget/fav_item_card.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:go_router/go_router.dart';

class FavScreen extends ConsumerWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<CakeModel> cakes = [];
    List<CakeModel> favItems = [];

    cakes = ref.watch(cakeProvider) as List<CakeModel>;
    // print(cakes);
    favItems = cakes
        .where((element) => (element.isFav == true && element.isFav != null))
        .toList();
    print(favItems);

    // final favs = cakes.where(c =>c)
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        titleSpacing: 0,
        shadowColor: Colors.black.withOpacity(0.2),
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        title: Text(
          'Your Favorite Cakes',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
        ),
        leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: IconButton(
              icon: const BackButtonIcon(),
              onPressed: () {
                context.goNamed(AppRouterEnum.home.name);
              },
            )),
        centerTitle: false,
      ),
      body: favItems.length != 0
          ? Container(
              color: Colors.white,
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: favItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return FavItemCard(
                    cake: favItems[index],
                    // shop: shops[index],
                  );
                },
              ),
            )
          : const Center(
              child: Text('No items found'),
            ),
    );
  }
}
