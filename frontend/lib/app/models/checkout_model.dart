// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_model.freezed.dart';
part 'checkout_model.g.dart';

@freezed
class CheckoutModel with _$CheckoutModel {
  const factory CheckoutModel({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "payment_method") String? paymentMethod,
    @JsonKey(name: "card_number") int? cardNumber,
    @JsonKey(name: "expiry_date") String? expiryDate,
    @JsonKey(name: "security_code") int? securityCode,
    @JsonKey(name: "shipping_address1") String? shippingAddress1,
    @JsonKey(name: "shipping_address2") String? shippingAddress2,
    @JsonKey(name: "phone_number") int? phoneNumber,
  }) = _CheckoutModel;

  factory CheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutModelFromJson(json);
}
