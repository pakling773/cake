import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/app/models/banners/banner_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banner_repository.g.dart';

@Riverpod(keepAlive: true)
class BannersRepository extends _$BannersRepository {
  @override
  FutureOr<List<BannerModel>> build() async {
    return await getBanners();
  }

  Future<List<BannerModel>> getBanners() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('slides').get();
      return querySnapshot.docs
          .map((doc) => BannerModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching banners: $e');
      return [];
    }
  }
}
