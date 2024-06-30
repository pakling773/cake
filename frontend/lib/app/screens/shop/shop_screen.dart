import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/app/providers/cake/cake_provider.dart';
import 'package:frontend/app/providers/shop_provider.dart';
import 'package:frontend/app/routes/app_routes_enum.dart';
import 'package:frontend/app/screens/shop/widgets/categories_list.dart';
import 'package:frontend/app/screens/shop/widgets/product_list.dart';
import 'package:frontend/app/screens/shop/widgets/shop_cover.dart';
import 'package:go_router/go_router.dart';

class ShopScreen extends ConsumerStatefulWidget {
  ShopScreen({super.key, required this.shop_id});

  String shop_id;

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen> {
  ShopModel shop = ShopModel.fromJson({});
  List<CakeModel> cakes = [];
  var categories = [];
  List<CakeModel> orignalCakes = [];

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      loadData();
    });

    super.initState();
  }

  void loadData() {
    final cakes_ = ref.watch(cakeProvider) as List<CakeModel>;
    final shopCakes =
        cakes_.where((cak) => cak.shopId == widget.shop_id).toList();

    setState(() {
      orignalCakes = shopCakes;
      cakes = shopCakes;
    });
  }

  onCategoryChange(String categoryId) async {
    var cakes_ = orignalCakes;
    if (categoryId == 'all') {
      cakes_ = orignalCakes;
    } else {
      cakes_ =
          await ShopAction().getCakesByCategory(categoryId, widget.shop_id);
    }

    setState(() {
      cakes = cakes_;
    });
  }

  @override
  Widget build(BuildContext context) {
    final shop =
        ref.watch(getShopsByIDProvider(shopID: widget.shop_id)).valueOrNull;
    final cats = ref
        .watch(getCategoriesByCakesProvider(cakes: orignalCakes))
        .valueOrNull;
    if (cats?.length != 0) {
      if (cats?[0]['id'] != 'all') {
        cats?.insert(0, {'id': 'all', 'name': 'All'});
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 312,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    // Navigate in Order screen
                    GestureDetector(
                      onTap: () {
                        context.goNamed(AppRouterEnum.detail.name);
                      },
                      child: (shop?.logo != null)
                          ? Image.network(
                              shop!.logo!,
                              height: 312,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/menu/cake.png',
                              height: 312,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                    ),
                    // Back icon Container
                    Positioned(
                      top: 60,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          context.goNamed(AppRouterEnum.home.name);
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xff3E3E3E).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: SvgPicture.asset('assets/icons/back_icon.svg'),
                        ),
                      ),
                    ),

                    // Shop Item Information Wrapper
                    (shop?.id != null)
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.bottomCenter,
                              // Shop Item Information Component
                              child: ShopCover(shop: shop!),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                const SizedBox(
                  height: 14,
                ),

                // Item Categories List  Component
                CategoriesList(
                  onCategoryChange: onCategoryChange,
                  cats: (cats != null) ? cats : [],
                ),
                const SizedBox(
                  height: 16,
                ),

                // Menu Item List  Component
                (cakes.length > 0)
                    ? ProductList(cakes: cakes)
                    : const Center(
                        child: Text('No items found.'),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
