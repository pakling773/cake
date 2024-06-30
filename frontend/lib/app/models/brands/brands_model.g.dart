// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brands_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BrandModelImpl _$$BrandModelImplFromJson(Map<String, dynamic> json) =>
    _$BrandModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      featured: json['featured'] as bool?,
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$BrandModelImplToJson(_$BrandModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'featured': instance.featured,
      'photo': instance.photo,
    };
