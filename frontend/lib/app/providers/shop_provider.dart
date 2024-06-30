import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:localstorage/localstorage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shop_provider.g.dart';

@Riverpod(keepAlive: true)
class Shop extends _$Shop {
  @override
  ShopModel? build() {
    return null;
  }

  Future<Object> setShop() async {
    final userId = localStorage.getItem('user_id');
    if (userId == null) {
      state = null;
      return false;
    }

    // state = user_id;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Fetch the user document by ID
    final shopDocument = await firestore
        .collection(ModulesEnum.shops.name)
        .where('user_id', isEqualTo: userId)
        .get();

    if (shopDocument.docs.isEmpty) {
      state = null;
      return false;
    }

    final shop = shopDocument.docs[0].data();
    print(shopDocument.docs[0].id);
    print(AddressModel.fromJson(shop['address1']));
    ShopModel shopModel = ShopModel(
      id: shopDocument.docs[0].id,
      userId: userId,
      name: shop['name'],
      address1: AddressModel.fromJson(shop['address1']),
      address2: shop['address2'],
      logo: shop['logo'],
      phoneNumber: shop['phone_number'],
      openingHour: DateTime.tryParse(shop['openingHour']),
      closeingHour: DateTime.tryParse(shop['closingHour']),
    );
    state = shopModel;
    return shopModel;
  }
}

@Riverpod(keepAlive: true)
Future<ShopModel> getShopsByID(GetShopsByIDRef ref,
    {required String shopID}) async {
  final action = ShopAction();
  return await action.getShopByID(shopID);
}

@Riverpod(keepAlive: true)
Future<List<Map<String, dynamic>>> getCategoriesByCakes(
    GetCategoriesByCakesRef ref,
    {required List<CakeModel> cakes}) async {
  final action = ShopAction();
  return await action.getCategoriesByCakes(cakes);
}
