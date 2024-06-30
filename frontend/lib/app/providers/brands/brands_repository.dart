import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/app/models/brands/brands_model.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brands_repository.g.dart';

@Riverpod(keepAlive: true)
class BrandsRepository extends _$BrandsRepository {
  @override
  FutureOr<List<BrandModel>> build() async {
    return await getBrands();
  }

  Future<List<BrandModel>> getBrands() async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(ModulesEnum.flavours.name)
          .get();
      return querySnapshot.docs
          .map((doc) => BrandModel.fromJson({...doc.data(), 'id': doc.id}))
          .toList();
    } catch (e) {
      print('Error fetching brands: $e');
      throw Exception(e);
    }
  }
}
