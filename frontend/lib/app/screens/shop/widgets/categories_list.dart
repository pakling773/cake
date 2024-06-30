import 'package:flutter/material.dart';
import 'package:frontend/app/screens/shop/widgets/item_categories.dart';

class CategoriesList extends StatefulWidget {
  CategoriesList(
      {super.key, required this.cats, required this.onCategoryChange});
  List<dynamic> cats;

  Function onCategoryChange;
  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 28,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.none,
            itemCount: widget.cats.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  ItemCategories(
                    category: widget.cats[index],
                    index: index,
                    selectedCategory: selectedCategory,
                    onTap: () {
                      widget.onCategoryChange(widget.cats[index]['id']);
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                ],
              );
            }));
  }
}
