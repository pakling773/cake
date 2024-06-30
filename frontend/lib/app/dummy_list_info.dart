import 'package:frontend/app/models/item_info_model.dart';
import 'package:frontend/app/models/shopping_cart_info_model.dart';

List<ItemInfoModel> item = [
  ItemInfoModel(
      name: 'Chocolate cake',
      price: '\$ 254.00',
      thumbnail: 'assets/images/Chocolate_cake.jpeg'),
  ItemInfoModel(
      name: 'Vanilla cake',
      price: '\$ 230.00',
      thumbnail: 'assets/images/vanilla-cake.jpeg'),
  ItemInfoModel(
      name: 'Carrot Cake',
      price: '\$ 330.00',
      thumbnail: 'assets/images/carrot-cake.jpeg'),
  ItemInfoModel(
      name: 'Strawberry Cake.',
      price: '\$ 150.00',
      thumbnail: 'assets/images/strawberry-cake.jpeg'),
];

List<ShoppingCartInfoModel> cart = [
  ShoppingCartInfoModel(
    name: 'Chocolate cake',
    price: '254',
    size: '40cm',
    thumbnail: 'assets/images/Chocolate_cake.jpeg',
  ),
  ShoppingCartInfoModel(
    name: 'Vanilla cake',
    price: '230',
    thumbnail: 'assets/images/vanilla-cake.jpeg',
    size: '10cm',
  ),
  ShoppingCartInfoModel(
    name: 'Carrot Cake',
    price: '100',
    thumbnail: 'assets/images/carrot-cake.jpeg',
    size: '20cm',
  ),
  // ShoppingCartInfoModel(
  //   name: 'Strawberry Cake.',
  //   price: '\$ 150.00',
  //   thumbnail: 'assets/images/strawberry-cake.jpeg',
  //   size: '30cm',
  // ),
];
