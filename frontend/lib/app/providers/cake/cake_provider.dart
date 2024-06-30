import 'package:frontend/app/actions/cake_action.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/category_model.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/main.dart';
import 'package:localstorage/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cake_provider.g.dart';

@Riverpod(keepAlive: true)
class Cake extends _$Cake {
  final _cakeAction = CakeAction();

  @override
  List<CakeModel>? build() {
    return null;
  }

  Future<dynamic> getCakes() async {
    var userId = localStorage.getItem('user_id');

    // if (userId == null) {
    //   state = null;
    //   return false;
    // }
    state = await _cakeAction.getCakes();
    // logger.i(state);
  }

  addToFav(CakeModel item) {
    final cakes = state;
    final cakeTrue = cakes!.map((cakeItem) {
      if (cakeItem.id == item.id) {
        if (cakeItem.isFav == true) {
          return cakeItem.copyWith(isFav: false);
        } else {
          return cakeItem.copyWith(isFav: true);
        }
      } else {
        return cakeItem;
      }
    }).toList();
    state = cakeTrue;
  }

  Future<dynamic> save(String? id, CakeModel data) async {
    await _cakeAction.saveCake(id, data);
    ref.read(getCakesByShopIdProvider(data.shopId!));
  }

  Future<CakeModel?> getCake(String id) async {
    return await _cakeAction.getCakeFromFirebase(id);
  }

  Future<List<CakeModel>> getCakesByShopId(String shopId) async {
    return await _cakeAction.getCakesByShop(shopId);
  }
}

@Riverpod(keepAlive: false)
Future<List<CakeModel>> getCakesByShopId(
    GetCakesByShopIdRef ref, String shopId) async {
  final cakeAction = CakeAction();

  return await cakeAction.getCakesByShop(shopId);
}

@Riverpod(keepAlive: true)
Future<List<CategoryModel>> getCategories(GetCategoriesRef ref) async {
  final cakeAction = CakeAction();
  return await cakeAction.getAllCategories();
}

@Riverpod(keepAlive: true)
Future<List<ShopModel>> getShops(GetShopsRef ref) async {
  final action = ShopAction();
  return await action.getShopLists();
}
