import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/app/actions/place_action.dart';
import 'package:frontend/app/actions/shop_action.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/app/providers/location_provider.dart';
import 'package:frontend/app/screens/home/widget/shop_card.dart';
import 'package:frontend/app/theme/constrants/colors.dart';
import 'package:frontend/main.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class ShopList extends ConsumerStatefulWidget {
  const ShopList({super.key});

  @override
  ConsumerState<ShopList> createState() => _ShopListState();
}

class _ShopListState extends ConsumerState<ShopList> {
  List<ShopModel> shops = [];
  @override
  void initState() {
    // List<ShopModel> = ref.read(shopProvider);
    getShops();
    super.initState();
  }

  final radiusInKm = 10;
  getShops() async {
    final userLocation = {
      'latitude': 22.277657,
      'longitude': 114.175827
    }; //await PlaceAction().getUserLocation();

    final shops_ = await ShopAction().getShopLists();

    var distance = const Distance();

    // final deviceLocation = await ref.watch(deviceLocationProvider.future);
    // logger.i(deviceLocation);

    if (userLocation['latitude'] == null || userLocation['longitude'] == null) {
      setState(() {
        print('-==== no locaitno');
        print(shops_);
        shops = shops_;
      });
    } else {
      final list = shops_.map((shop) {
        final address = shop.address1;
        if (address == null) {
          return shop;
        }
        final km = distance.as(
            LengthUnit.Kilometer,
            LatLng(userLocation['latitude']!, userLocation['longitude']!),
            LatLng(address.latitude!, address.longitude!));
        return shop.copyWith(distance: km);
      })
          // .where((shop) => shop.distance! <= radiusInKm)
          .toList();

      setState(() {
        shops = list;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHOPS NEARBY YOU',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.black,
                ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 6,
          ),

          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsetsDirectional.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shops.length,
            itemBuilder: (BuildContext context, int index) {
              return ShopCard(
                shop: shops[index],
              );
            },
          ),

          // Shop Card
        ],
      ),
    );
  }
}
