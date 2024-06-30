import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/cart/cart_model.dart';
import 'package:frontend/app/providers/cart/cart_provider.dart';
import 'package:frontend/app/screens/cart/widgets/cart_checkout.dart';
import 'package:frontend/app/screens/cart/widgets/shopping_cart.dart';

class ShoppingCartList extends ConsumerStatefulWidget {
  const ShoppingCartList({super.key});

  @override
  ConsumerState<ShoppingCartList> createState() => _ShoppingCartList();
}

class _ShoppingCartList extends ConsumerState<ShoppingCartList> {
  List<CartModel> cartItems = [];
  int itemCount = 1;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) => setCarts());

    super.initState();
  }

  void _remove(int index) {
    // setState(() {
    //   cartItems.removeAt(index);
    // });
  }

  addToFav(CakeModel cake) {
    // print(cake);
    // ref.read(cakeProvider.notifier).addToFav(cake);
    // setState(() {
    //   cartItems = ref.read(cartProvider)!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    cartItems = ref.watch(cartProvider)!;
    return (cartItems.isNotEmpty)
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15),
                        // Shoping Cart Component
                        child: ShoppingCart(
                          cart: cartItems[index],
                          index: index,
                          // onAddToFav: addToFav,
                        ),
                      );
                    }),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CartCheckout(),
              )
            ],
          )
        : const Center(
            child: Text('Shopping Cart Empty!'),
          );
  }
}
