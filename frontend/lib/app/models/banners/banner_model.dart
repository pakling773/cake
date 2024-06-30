// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.freezed.dart';
part 'banner_model.g.dart';

BannerModel bannerModelFromMap(String str) =>
    BannerModel.fromJson(json.decode(str));

String bannerModelToMap(BannerModel data) => json.encode(data.toJson());

@freezed
class BannerModel with _$BannerModel {
  const factory BannerModel({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "photo") String? photo,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}
