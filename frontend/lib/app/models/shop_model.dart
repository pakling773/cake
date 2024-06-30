// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
class ShopModel with _$ShopModel {
  @JsonSerializable(explicitToJson: true)
  const factory ShopModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "user_id") String? userId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "address1") AddressModel? address1,
    @JsonKey(name: "address2") String? address2,
    @JsonKey(name: "logo") String? logo,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "openingHour") DateTime? openingHour,
    @JsonKey(name: "closingHour") DateTime? closeingHour,
    @JsonKey(name: "distance") double? distance,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}

@freezed
class AddressModel with _$AddressModel {
  @JsonSerializable(explicitToJson: true)
  const factory AddressModel({
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "latitude") double? latitude,
    @JsonKey(name: "longitude") double? longitude,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
}
