// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cake_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CakeModelImpl _$$CakeModelImplFromJson(Map<String, dynamic> json) =>
    _$CakeModelImpl(
      id: json['id'] as String?,
      categoryId: json['category_id'] as String?,
      featured: json['featured'] as bool?,
      flavourId: json['flavour_id'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      price: (json['price'] as num?)?.toInt(),
      shopId: json['shop_id'] as String?,
      description: json['description'] as String?,
      specification: json['specification'] as String?,
      isFav: json['isFav'] as bool?,
    );

Map<String, dynamic> _$$CakeModelImplToJson(_$CakeModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'featured': instance.featured,
      'flavour_id': instance.flavourId,
      'name': instance.name,
      'photo': instance.photo,
      'price': instance.price,
      'shop_id': instance.shopId,
      'description': instance.description,
      'specification': instance.specification,
      'isFav': instance.isFav,
    };
