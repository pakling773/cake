// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopModelImpl _$$ShopModelImplFromJson(Map<String, dynamic> json) =>
    _$ShopModelImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      address1: json['address1'] == null
          ? null
          : AddressModel.fromJson(json['address1'] as Map<String, dynamic>),
      address2: json['address2'] as String?,
      logo: json['logo'] as String?,
      phoneNumber: json['phone_number'] as String?,
      openingHour: json['openingHour'] == null
          ? null
          : DateTime.parse(json['openingHour'] as String),
      closeingHour: json['closingHour'] == null
          ? null
          : DateTime.parse(json['closingHour'] as String),
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ShopModelImplToJson(_$ShopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'address1': instance.address1?.toJson(),
      'address2': instance.address2,
      'logo': instance.logo,
      'phone_number': instance.phoneNumber,
      'openingHour': instance.openingHour?.toIso8601String(),
      'closingHour': instance.closeingHour?.toIso8601String(),
      'distance': instance.distance,
    };

_$AddressModelImpl _$$AddressModelImplFromJson(Map<String, dynamic> json) =>
    _$AddressModelImpl(
      address: json['address'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AddressModelImplToJson(_$AddressModelImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
