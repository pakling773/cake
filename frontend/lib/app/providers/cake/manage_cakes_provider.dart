import 'package:frontend/app/actions/cake_action.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manage_cakes_provider.g.dart';

@Riverpod(keepAlive: true)
class ManageCakes extends _$ManageCakes {
  final _cakeAction = CakeAction();

  @override
  FutureOr<List<CakeModel>?> build() async {
    return null;
  }

  addToFav(CakeModel item) {
    final cakes = state.value;
    if (cakes != null) {
      final updatedCakes = cakes.map((cakeItem) {
        if (cakeItem.id == item.id) {
          return cakeItem.copyWith(isFav: !(cakeItem.isFav ?? false));
        } else {
          return cakeItem;
        }
      }).toList();
      state = AsyncValue.data(updatedCakes);
    }
  }

  Future<void> save(String? id, CakeModel data) async {
    await _cakeAction.saveCake(id, data);
    await getCakesByShopId(data.shopId!);
  }

  Future<void> getCakesByShopId(String shopId) async {
    state = const AsyncValue.loading();
    try {
      final cakes = await _cakeAction.getCakesByShop(shopId);
      print(cakes);
      state = AsyncValue.data(cakes);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteCakeId(String id) async {
    state = const AsyncValue.loading();
    try {
      final cake = state.value?.firstWhere(
        (el) => el.id == id,
      );
      await _cakeAction.deleteCake(id, cake: cake);

      if (cake != null && cake.shopId != null) {
        getCakesByShopId(cake.shopId!);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
