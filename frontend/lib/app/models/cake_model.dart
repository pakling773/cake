// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cake_model.freezed.dart';
part 'cake_model.g.dart';

@freezed
class CakeModel with _$CakeModel {
  const CakeModel._();

  @JsonSerializable(explicitToJson: true)
  const factory CakeModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "category_id") String? categoryId,
    @JsonKey(name: "featured") bool? featured,
    @JsonKey(name: "flavour_id") String? flavourId,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "price") int? price,
    @JsonKey(name: "shop_id") String? shopId,
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "specification") String? specification,
    @JsonKey(name: "isFav") bool? isFav,
  }) = _CakeModel;

  @override
  factory CakeModel.fromJson(Map<String, dynamic> json) =>
      _$CakeModelFromJson(json);
}
