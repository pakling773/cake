import 'dart:convert';

import 'package:frontend/app/common/cake_sizes.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/cart/cart_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  final minSize = cakeSizes[0];
  @override
  List<CartModel>? build() {
    return getCartStorage();
  }

  num get getTotal {
    num total = 0.0;
    state?.forEach((item) => total += (item.total ?? 0));
    return total;
  }

  getCartStorage() {
    List<CartModel> cart = [];
    var cartStorage = localStorage.getItem('cart');
    if (cartStorage != null) {
      var csJson = jsonDecode(cartStorage) as List;
      cart = csJson.map((e) => CartModel.fromJson(e)).toList();
    }
    print(cart);
    return cart;
  }

  setCartStorage(state) {
    localStorage.setItem('cart', jsonEncode(state));
  }

  addToCart(CakeModel cake, {String size = 'minSize'}) {
    List<CartModel> exists = state!.where((c) {
      if (c.cake.id == cake.id) {
        return true;
      } else {
        return false;
      }
    }).toList();

    if (exists.isEmpty) {
      var cart = CartModel(cake: cake);
      cart = cart.copyWith(price: cake.price, quantity: 1, total: cake.price);

      state = [...state!, cart];

      state = state;
      setCartStorage(state);
    }
  }

  increment(int index) {
    if (state?[index] != null) {
      CartModel item = state![index];
      final newQ = item.quantity! + 1;
      item = item.copyWith(quantity: newQ, total: newQ * item.price!);
      state?[index] = item;
      state = [...state!];
      setCartStorage(state);
    }
  }

  decrement(int index) {
    if (state?[index] != null) {
      CartModel item = state![index];
      if (item.quantity == 1) {
        return false;
      }
      final newQ = item.quantity! - 1;
      item = item.copyWith(quantity: newQ, total: newQ * item.price!);
      state?[index] = item;
      state = [...state!];
    }
  }

  remove(int index) {
    List<CartModel> currentState = state!;
    currentState.removeAt(index);
    // state = currentState;
    state = [...currentState];
    setCartStorage(state);
  }

  clearAll() {
    state = [];
    setCartStorage(state);
  }
}
