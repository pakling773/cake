import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/common/cake_sizes.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/@shared_widgets/app_image.dart';
import 'package:frontend/app/screens/product_detail/widgets/cart_add.dart';
import 'package:frontend/app/screens/product_detail/widgets/detail_info.dart';
import 'package:frontend/app/screens/product_detail/widgets/item_size_list.dart';
import 'package:frontend/app/screens/product_detail/widgets/top_icon_menu.dart';
import 'package:go_router/go_router.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  ProductDetailScreen({super.key, required this.cake});

  CakeModel cake;

  @override
  ConsumerState<ProductDetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<ProductDetailScreen> {
  String selectedSize = cakeSizes[0];

  changeSize(String size) {
    selectedSize = size;
  }

  addToCart() {
    ref.read(cartProvider.notifier).addToCart(widget.cake);
    context.goNamed(AppRouterEnum.cart.name);
  }

  addToFav() {
    final add = ref.read(cakeProvider.notifier).addToFav(widget.cake);
    setState(() {
      widget.cake = widget.cake
          .copyWith(isFav: (widget.cake.isFav == true) ? false : true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 378,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    // Order Item thumbnail
                    child: AppImage(
                      widget.cake.photo,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 378,
                    ),
                  ),

                  // Top Menu Component
                  Positioned(
                      top: 60,
                      child: TopIconMenu(
                        isFav: widget.cake.isFav!,
                        onAddToFav: addToFav,
                      )),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const SizedBox(
                  height: 16,
                ),

                // Item Information Component
                DetailInfo(
                  cake: widget.cake,
                ),
                const SizedBox(
                  height: 32,
                ),

                // Item Size  Component
                ItemSizeList(
                  onChangeSize: changeSize,
                  text: widget.cake.specification ?? '',
                ),
                const SizedBox(
                  height: 48,
                ),

                // Add To Cart Component
                CartAdd(
                  onAddToCart: addToCart,
                  cake: widget.cake,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
