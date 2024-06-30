// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutModelImpl _$$CheckoutModelImplFromJson(Map<String, dynamic> json) =>
    _$CheckoutModelImpl(
      name: json['name'] as String?,
      paymentMethod: json['payment_method'] as String?,
      cardNumber: (json['card_number'] as num?)?.toInt(),
      expiryDate: json['expiry_date'] as String?,
      securityCode: (json['security_code'] as num?)?.toInt(),
      shippingAddress1: json['shipping_address1'] as String?,
      shippingAddress2: json['shipping_address2'] as String?,
      phoneNumber: (json['phone_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CheckoutModelImplToJson(_$CheckoutModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'payment_method': instance.paymentMethod,
      'card_number': instance.cardNumber,
      'expiry_date': instance.expiryDate,
      'security_code': instance.securityCode,
      'shipping_address1': instance.shippingAddress1,
      'shipping_address2': instance.shippingAddress2,
      'phone_number': instance.phoneNumber,
    };
