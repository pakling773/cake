import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/category_model.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:frontend/main.dart';

class CakeAction {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static CakeAction? _instance;

  static CakeAction get instance => _instance!;

  Future<List<CakeModel>> getCakes() async {
    List<CakeModel> cakes = [];
    final cakeDocs = await _firestore.collection(ModulesEnum.cakes.name).get();

    for (var row in cakeDocs.docs) {
      final data = row.data();
      final singleCake = CakeModel(
        id: row.id,
        featured: data['featured'] ?? false,
        flavourId: data['flavour_id'] ?? '',
        name: data['name'] ?? '',
        photo: data['photo'] ?? '',
        price: data['price'] ?? 0.0,
        shopId: data['shop_id'] ?? '',
        categoryId: data['category_id'] ?? '',
        isFav: false,
        description: data['description'] ?? '',
        specification: data['specification'] ?? '',
      );
      cakes.add(singleCake);
    }

    return cakes;
  }

  Future<CakeModel?> getCakeFromFirebase(String id) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(ModulesEnum.cakes.name).doc(id).get();

      if (doc.exists) {
        final data = doc.data() as Map<String, dynamic>;
        return CakeModel(
          id: doc.id,
          featured: data['featured'] ?? false,
          flavourId: data['flavour_id'] ?? '',
          name: data['name'] ?? '',
          photo: data['photo'] ?? '',
          price: data['price'] ?? 0.0,
          shopId: data['shop_id'] ?? '',
          categoryId: data['category_id'] ?? '',
          description: data['description'] ?? '',
          specification: data['specification'] ?? '',
        );
      } else {
        throw Exception('No cake found with ID: $id');
      }
    } catch (e, _) {
      throw Exception('Error fetching cake with ID: $e');
    }
  }

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final categoryDocs =
          await firestore.collection(ModulesEnum.category.name).get();

      List<CategoryModel> categories = categoryDocs.docs.map((doc) {
        final data = doc.data();
        return CategoryModel.fromJson({
          ...data,
          'id': doc.id,
        });
      }).toList();

      return categories;
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  Future<dynamic> saveCake(String? id, CakeModel cake) async {
    try {
      if (id != null) {
        return await _firestore
            .collection(ModulesEnum.cakes.name)
            .doc(id)
            .update(cake.toJson());
      } else {
        return await _firestore
            .collection(ModulesEnum.cakes.name)
            .add(cake.toJson());
      }
    } catch (e) {
      print('Error saving cake: $e');
      throw Exception('Error saving cake');
    }
  }

  Future<List<CakeModel>> getCakesByShop(String shopId) async {
    final catDocument = await _firestore
        .collection(ModulesEnum.cakes.name)
        .where('shop_id', isEqualTo: shopId)
        .get();

    final allData = catDocument.docs.map((doc) {
      var data = doc.data();
      CakeModel cake = CakeModel(
        id: doc.id,
        categoryId: data['category_id'],
        featured: data['featured'] ?? false,
        flavourId: data['flavour_id'],
        name: data['name'],
        photo: data['photo'],
        price: data['price'],
        shopId: data['shop_id'],
        description: data['description'],
        specification: data['specification'],
      );
      return cake;
    }).toList();

    return allData;
  }

  Future<dynamic> deleteCake(String cakeId, {CakeModel? cake}) async {
    try {
      if (cake != null && cake.photo != null) {
        FirebaseStorage.instance.ref().child(cake.photo!).delete();
      }

      await _firestore.collection('cakes').doc(cakeId).delete();
    } catch (e) {
      print('Failed to delete cake: $e');
      throw Exception('Failed to delete cake: $e');
    }
  }

  Future<List<CakeModel>> getCakesByMood(List<String> moods) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(ModulesEnum.cakes.name)
          .where('tags', arrayContainsAny: moods)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return CakeModel(
          id: doc.id,
          categoryId: data['category_id'],
          featured: data['featured'] ?? false,
          flavourId: data['flavour_id'],
          name: data['name'],
          photo: data['photo'],
          price: data['price'],
          shopId: data['shop_id'],
          description: data['description'],
          specification: data['specification'],
        );
      }).toList();
    } catch (e) {
      logger.e('Error fetching cakes: $e');
      throw Exception('Failed to fetch cakes: $e');
    }
  }
}
