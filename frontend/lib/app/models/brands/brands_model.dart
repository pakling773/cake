// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'brands_model.freezed.dart';
part 'brands_model.g.dart';

BrandModel brandModelFromMap(String str) =>
    BrandModel.fromJson(json.decode(str));

String brandModelToMap(BrandModel data) => json.encode(data.toJson());

@freezed
class BrandModel with _$BrandModel {
  const factory BrandModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "featured") bool? featured,
    @JsonKey(name: "photo") String? photo,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);
}
