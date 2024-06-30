// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceResponseImpl _$$PlaceResponseImplFromJson(Map<String, dynamic> json) =>
    _$PlaceResponseImpl(
      predictions: (json['predictions'] as List<dynamic>?)
          ?.map((e) => Prediction.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$PlaceResponseImplToJson(_$PlaceResponseImpl instance) =>
    <String, dynamic>{
      'predictions': instance.predictions,
      'status': instance.status,
    };

_$PredictionImpl _$$PredictionImplFromJson(Map<String, dynamic> json) =>
    _$PredictionImpl(
      description: json['description'] as String?,
      matchedSubstrings: (json['matched_substrings'] as List<dynamic>?)
          ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structured_formatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structured_formatting'] as Map<String, dynamic>),
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
          .toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PredictionImplToJson(_$PredictionImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'matched_substrings': instance.matchedSubstrings,
      'place_id': instance.placeId,
      'reference': instance.reference,
      'structured_formatting': instance.structuredFormatting,
      'terms': instance.terms,
      'types': instance.types,
    };

_$MatchedSubstringImpl _$$MatchedSubstringImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchedSubstringImpl(
      length: (json['length'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MatchedSubstringImplToJson(
        _$MatchedSubstringImpl instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };

_$StructuredFormattingImpl _$$StructuredFormattingImplFromJson(
        Map<String, dynamic> json) =>
    _$StructuredFormattingImpl(
      mainText: json['main_text'] as String?,
      mainTextMatchedSubstrings:
          (json['main_text_matched_substrings'] as List<dynamic>?)
              ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
              .toList(),
      secondaryText: json['secondary_text'] as String?,
    );

Map<String, dynamic> _$$StructuredFormattingImplToJson(
        _$StructuredFormattingImpl instance) =>
    <String, dynamic>{
      'main_text': instance.mainText,
      'main_text_matched_substrings': instance.mainTextMatchedSubstrings,
      'secondary_text': instance.secondaryText,
    };

_$TermImpl _$$TermImplFromJson(Map<String, dynamic> json) => _$TermImpl(
      offset: (json['offset'] as num?)?.toInt(),
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$TermImplToJson(_$TermImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'value': instance.value,
    };
