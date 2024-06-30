// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/app/models/cart/cart_model.dart';

part 'order_summary_model.freezed.dart';
part 'order_summary_model.g.dart';

OrderSummaryRequestModel orderSummaryRequestModelFromJson(String str) =>
    OrderSummaryRequestModel.fromJson(json.decode(str));

String orderSummaryRequestModelToJson(OrderSummaryRequestModel data) =>
    json.encode(data.toJson());

@freezed
class OrderSummaryRequestModel with _$OrderSummaryRequestModel {
  @JsonSerializable(explicitToJson: true)
  const factory OrderSummaryRequestModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "payment_info") PaymentInfo? paymentInfo,
    @JsonKey(name: "shipping_info") ShippingInfo? shippingInfo,
    @JsonKey(name: "order_summary") OrderDetailsSummary? orderSummary,
    @JsonKey(name: "cart") List<CartModel>? cart,
    @JsonKey(name: "points") num? points,
  }) = _OrderSummaryRequestModel;

  factory OrderSummaryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryRequestModelFromJson(json);
}

@freezed
class OrderDetailsSummary with _$OrderDetailsSummary {
  @JsonSerializable(explicitToJson: true)
  const factory OrderDetailsSummary({
    @JsonKey(name: "quantity") int? quantity,
    @JsonKey(name: "subtotal") double? subtotal,
    @JsonKey(name: "delivery_charge") double? deliveryCharge,
    @JsonKey(name: "total") double? total,
  }) = _OrderDetailsSummary;

  factory OrderDetailsSummary.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsSummaryFromJson(json);
}

@freezed
class PaymentInfo with _$PaymentInfo {
  @JsonSerializable(explicitToJson: true)
  const factory PaymentInfo({
    @JsonKey(name: "mayment_method") String? maymentMethod,
    @JsonKey(name: "account_number") String? accountNumber,
  }) = _PaymentInfo;

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);
}

@freezed
class ShippingInfo with _$ShippingInfo {
  @JsonSerializable(explicitToJson: true)
  const factory ShippingInfo({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "address_1") String? address1,
    @JsonKey(name: "address_2") String? address2,
  }) = _ShippingInfo;

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);
}
