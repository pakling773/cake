// ignore_for_file: invalid_annotation_target

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'places_model.freezed.dart';
part 'places_model.g.dart';

PlaceResponse placeResponseFromJson(String str) =>
    PlaceResponse.fromJson(json.decode(str));

String placeResponseToJson(PlaceResponse data) => json.encode(data.toJson());

@freezed
class PlaceResponse with _$PlaceResponse {
  const factory PlaceResponse({
    @JsonKey(name: "predictions") List<Prediction>? predictions,
    @JsonKey(name: "status") String? status,
  }) = _PlaceResponse;

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);
}

@freezed
class Prediction with _$Prediction {
  const factory Prediction({
    @JsonKey(name: "description") String? description,
    @JsonKey(name: "matched_substrings")
    List<MatchedSubstring>? matchedSubstrings,
    @JsonKey(name: "place_id") String? placeId,
    @JsonKey(name: "reference") String? reference,
    @JsonKey(name: "structured_formatting")
    StructuredFormatting? structuredFormatting,
    @JsonKey(name: "terms") List<Term>? terms,
    @JsonKey(name: "types") List<String>? types,
  }) = _Prediction;

  factory Prediction.fromJson(Map<String, dynamic> json) =>
      _$PredictionFromJson(json);
}

@freezed
class MatchedSubstring with _$MatchedSubstring {
  const factory MatchedSubstring({
    @JsonKey(name: "length") int? length,
    @JsonKey(name: "offset") int? offset,
  }) = _MatchedSubstring;

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) =>
      _$MatchedSubstringFromJson(json);
}

@freezed
class StructuredFormatting with _$StructuredFormatting {
  const factory StructuredFormatting({
    @JsonKey(name: "main_text") String? mainText,
    @JsonKey(name: "main_text_matched_substrings")
    List<MatchedSubstring>? mainTextMatchedSubstrings,
    @JsonKey(name: "secondary_text") String? secondaryText,
  }) = _StructuredFormatting;

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingFromJson(json);
}

@freezed
class Term with _$Term {
  const factory Term({
    @JsonKey(name: "offset") int? offset,
    @JsonKey(name: "value") String? value,
  }) = _Term;

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}
