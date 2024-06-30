// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderSummaryRequestModelImpl _$$OrderSummaryRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderSummaryRequestModelImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      paymentInfo: json['payment_info'] == null
          ? null
          : PaymentInfo.fromJson(json['payment_info'] as Map<String, dynamic>),
      shippingInfo: json['shipping_info'] == null
          ? null
          : ShippingInfo.fromJson(
              json['shipping_info'] as Map<String, dynamic>),
      orderSummary: json['order_summary'] == null
          ? null
          : OrderDetailsSummary.fromJson(
              json['order_summary'] as Map<String, dynamic>),
      cart: (json['cart'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      points: json['points'] as num?,
    );

Map<String, dynamic> _$$OrderSummaryRequestModelImplToJson(
        _$OrderSummaryRequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'payment_info': instance.paymentInfo?.toJson(),
      'shipping_info': instance.shippingInfo?.toJson(),
      'order_summary': instance.orderSummary?.toJson(),
      'cart': instance.cart?.map((e) => e.toJson()).toList(),
      'points': instance.points,
    };

_$OrderDetailsSummaryImpl _$$OrderDetailsSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$OrderDetailsSummaryImpl(
      quantity: (json['quantity'] as num?)?.toInt(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      deliveryCharge: (json['delivery_charge'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$OrderDetailsSummaryImplToJson(
        _$OrderDetailsSummaryImpl instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'subtotal': instance.subtotal,
      'delivery_charge': instance.deliveryCharge,
      'total': instance.total,
    };

_$PaymentInfoImpl _$$PaymentInfoImplFromJson(Map<String, dynamic> json) =>
    _$PaymentInfoImpl(
      maymentMethod: json['mayment_method'] as String?,
      accountNumber: json['account_number'] as String?,
    );

Map<String, dynamic> _$$PaymentInfoImplToJson(_$PaymentInfoImpl instance) =>
    <String, dynamic>{
      'mayment_method': instance.maymentMethod,
      'account_number': instance.accountNumber,
    };

_$ShippingInfoImpl _$$ShippingInfoImplFromJson(Map<String, dynamic> json) =>
    _$ShippingInfoImpl(
      name: json['name'] as String?,
      address1: json['address_1'] as String?,
      address2: json['address_2'] as String?,
    );

Map<String, dynamic> _$$ShippingInfoImplToJson(_$ShippingInfoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address_1': instance.address1,
      'address_2': instance.address2,
    };
