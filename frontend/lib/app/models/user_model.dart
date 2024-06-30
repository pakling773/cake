// To parse this JSON data, do
//
//     final userModel = userModelFromMap(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") required String email,
    @JsonKey(name: "photoUrl") String? photoUrl,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "accessToken") String? accessToken,
    @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
    @JsonKey(name: "points") num? points,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
