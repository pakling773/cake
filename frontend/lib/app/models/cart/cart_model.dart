// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/app/models/cake_model.dart';

part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@freezed
class CartModel with _$CartModel {
  @JsonSerializable(explicitToJson: true)
  const factory CartModel(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "cake") required CakeModel cake,
      @JsonKey(name: "quantity") int? quantity,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "total") int? total}) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
}
