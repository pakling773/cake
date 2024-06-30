// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

CategoryModel categoryModelFromMap(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToMap(CategoryModel data) => json.encode(data.toJson());

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
