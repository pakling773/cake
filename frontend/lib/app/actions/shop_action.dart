import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:frontend/app/models/shop_model.dart';
import 'package:frontend/main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localstorage/localstorage.dart';

class ShopAction {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        logger.i(pickedFile.path);
        return File(pickedFile.path);
      }
    } catch (e) {
      logger.i(e);
    }

    return null;
  }

  Future<String?> uploadImage(File imageFile) async {
    print('upload image');
    final storage = FirebaseStorage.instance;
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    print('images/$imageName');
    final imageRef = storage.ref().child('images/$imageName');
    final uploadTask = imageRef.putData(await imageFile.readAsBytes());

    final snapshot = await uploadTask.whenComplete(() => null);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  }

  Future<dynamic> saveShop(form, {String id = ''}) async {
    String userId = localStorage.getItem('user_id')!;
    final shopData = ShopModel(
      name: form.value['shop_name'] as String,
      address1: form.value['address1'] as AddressModel?,
      address2: form.value['address2'] as String,
      logo: form.value['logo'] as String,
      phoneNumber: form.value['phone_number'] as String,
      userId: userId,
      openingHour: form.value['openingHour'] as DateTime,
      closeingHour: form.value['closeingHour'] as DateTime,
    );

    CollectionReference shop =
        FirebaseFirestore.instance.collection(ModulesEnum.shops.name);

    if (id == '') {
      DocumentReference add = await shop.add(shopData.toJson());
      localStorage.setItem('shop_id', add.id);
      id = add.id;
    } else {
      await shop.doc(id).update(shopData.toJson());
    }

    //

    return id;
  }

  Future<List<ShopModel>> getShopLists() async {
    List<ShopModel> list = [];
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(ModulesEnum.shops.name);
    QuerySnapshot querySnapshot = await collectionRef.get();
    final allData = querySnapshot.docs.map((doc) {
      var data = ShopModel.fromJson(doc.data() as Map<String, dynamic>);
      data = data.copyWith(id: doc.id);
      list.add(data);
      return doc;
    }).toList();

    return list;
  }

  Future<ShopModel> getShopByID(String shopId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // try {
    final shopDocument =
        await firestore.collection(ModulesEnum.shops.name).doc(shopId).get();

    final shop =
        ShopModel.fromJson(shopDocument.data() as Map<String, dynamic>);
    final s = shop.copyWith(id: shopDocument.id);
    return s;
    // } catch (e) {
    //   print(e);
    // }
    // return null;
  }

  Future<List<Map<String, dynamic>>> getCategoriesByCakes(
      List<CakeModel> cakes) async {
    List<String> categoriesIds = [];

    categoriesIds = cakes.map((c) => c.categoryId!).toList();
    if (categoriesIds.isEmpty == true) {
      return [];
    }
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final catDocument = await firestore
        .collection(ModulesEnum.category.name)
        .where(FieldPath.documentId, whereIn: categoriesIds)
        .get();

    final allData = catDocument.docs.map((doc) {
      // print(doc.id);
      var data = doc.data();
      data['id'] = doc.id;
      return data;
    }).toList();

    return allData;
  }

  getCakesByCategory(String catId, String shopId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final catDocument = await firestore
        .collection(ModulesEnum.cakes.name)
        .where('category_id', isEqualTo: catId)
        .where('shop_id', isEqualTo: shopId)
        .get();

    final allData = catDocument.docs.map((doc) {
      // print(doc.id);
      var data = doc.data();

      // data['id'] = doc.id;

      CakeModel cake = CakeModel(
        id: doc.id,
        categoryId: data['category_id'],
        featured: (data['featured'] == true) ? true : false,
        flavourId: data['flavour_id'],
        name: data['name'],
        photo: data['photo'],
        price: data['price'],
        shopId: data['shop_id'],
      );
      // var cake = data;
      return cake;
    }).toList();

    return allData;
  }
}
