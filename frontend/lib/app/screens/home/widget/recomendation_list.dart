import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/dummy_list_info.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/screens/@shared_widgets/product_card.dart';

class RecomendationList extends ConsumerStatefulWidget {
  const RecomendationList({super.key});

  @override
  ConsumerState<RecomendationList> createState() => _RecomendationListState();
}

class _RecomendationListState extends ConsumerState<RecomendationList> {
  final List<bool> isFavourite = List.filled(item.length, false);
  List<CakeModel> recomendedList = [];

  getCakeList() {
    isFavourite[0] = true;
  }

  void toggleFavorite(CakeModel item) {
    // print('togg fav$index');
    ref.read(cakeProvider.notifier).addToFav(item);
  }

  @override
  Widget build(BuildContext context) {
    final cakeList = ref.watch(cakeProvider);

    recomendedList = cakeList!.where((i) => i.featured!).toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Recommended for you',
              style: Theme.of(context).textTheme.displayMedium!.copyWith(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        (recomendedList.isNotEmpty)
            ? Container(
                height: 230,
                alignment: Alignment.centerLeft,
                child: ListView.separated(
                  shrinkWrap: true,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemCount: recomendedList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(
                      // favourite: isFavourite[index],
                      item: recomendedList[index],
                      // onToogleFavourite: toggleFavorite,
                      width: 157,
                      index: index,
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 20,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
