import 'package:flutter/material.dart';
import 'package:frontend/app/dummy_list_info.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/screens/@shared_widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key, required this.cakes});

  final List<CakeModel> cakes;

  @override
  State<StatefulWidget> createState() => _MenuItemList();
}

class _MenuItemList extends State<ProductList> {
  final List<bool> isFavourite = List.filled(item.length, false);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20)
          .copyWith(bottom: 20 + MediaQuery.of(context).padding.bottom),
      color: Colors.white.withOpacity(0.0),
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsetsDirectional.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.cakes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          // Menu Item Card Component
          return ProductCard(
            item: widget.cakes[index],
            // favourite: isFavourite[index],
            // onToogleFavourite: () => toogleFavourite(index),
          );
        },
      ),
    );
  }
}
