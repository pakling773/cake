// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'places_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) {
  return _PlaceResponse.fromJson(json);
}

/// @nodoc
mixin _$PlaceResponse {
  @JsonKey(name: "predictions")
  List<Prediction>? get predictions => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceResponseCopyWith<PlaceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceResponseCopyWith<$Res> {
  factory $PlaceResponseCopyWith(
          PlaceResponse value, $Res Function(PlaceResponse) then) =
      _$PlaceResponseCopyWithImpl<$Res, PlaceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "predictions") List<Prediction>? predictions,
      @JsonKey(name: "status") String? status});
}

/// @nodoc
class _$PlaceResponseCopyWithImpl<$Res, $Val extends PlaceResponse>
    implements $PlaceResponseCopyWith<$Res> {
  _$PlaceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictions = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      predictions: freezed == predictions
          ? _value.predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Prediction>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceResponseImplCopyWith<$Res>
    implements $PlaceResponseCopyWith<$Res> {
  factory _$$PlaceResponseImplCopyWith(
          _$PlaceResponseImpl value, $Res Function(_$PlaceResponseImpl) then) =
      __$$PlaceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "predictions") List<Prediction>? predictions,
      @JsonKey(name: "status") String? status});
}

/// @nodoc
class __$$PlaceResponseImplCopyWithImpl<$Res>
    extends _$PlaceResponseCopyWithImpl<$Res, _$PlaceResponseImpl>
    implements _$$PlaceResponseImplCopyWith<$Res> {
  __$$PlaceResponseImplCopyWithImpl(
      _$PlaceResponseImpl _value, $Res Function(_$PlaceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? predictions = freezed,
    Object? status = freezed,
  }) {
    return _then(_$PlaceResponseImpl(
      predictions: freezed == predictions
          ? _value._predictions
          : predictions // ignore: cast_nullable_to_non_nullable
              as List<Prediction>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaceResponseImpl implements _PlaceResponse {
  const _$PlaceResponseImpl(
      {@JsonKey(name: "predictions") final List<Prediction>? predictions,
      @JsonKey(name: "status") this.status})
      : _predictions = predictions;

  factory _$PlaceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceResponseImplFromJson(json);

  final List<Prediction>? _predictions;
  @override
  @JsonKey(name: "predictions")
  List<Prediction>? get predictions {
    final value = _predictions;
    if (value == null) return null;
    if (_predictions is EqualUnmodifiableListView) return _predictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "status")
  final String? status;

  @override
  String toString() {
    return 'PlaceResponse(predictions: $predictions, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._predictions, _predictions) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_predictions), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceResponseImplCopyWith<_$PlaceResponseImpl> get copyWith =>
      __$$PlaceResponseImplCopyWithImpl<_$PlaceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceResponseImplToJson(
      this,
    );
  }
}

abstract class _PlaceResponse implements PlaceResponse {
  const factory _PlaceResponse(
      {@JsonKey(name: "predictions") final List<Prediction>? predictions,
      @JsonKey(name: "status") final String? status}) = _$PlaceResponseImpl;

  factory _PlaceResponse.fromJson(Map<String, dynamic> json) =
      _$PlaceResponseImpl.fromJson;

  @override
  @JsonKey(name: "predictions")
  List<Prediction>? get predictions;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$PlaceResponseImplCopyWith<_$PlaceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Prediction _$PredictionFromJson(Map<String, dynamic> json) {
  return _Prediction.fromJson(json);
}

/// @nodoc
mixin _$Prediction {
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "matched_substrings")
  List<MatchedSubstring>? get matchedSubstrings =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "place_id")
  String? get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: "reference")
  String? get reference => throw _privateConstructorUsedError;
  @JsonKey(name: "structured_formatting")
  StructuredFormatting? get structuredFormatting =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "terms")
  List<Term>? get terms => throw _privateConstructorUsedError;
  @JsonKey(name: "types")
  List<String>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredictionCopyWith<Prediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredictionCopyWith<$Res> {
  factory $PredictionCopyWith(
          Prediction value, $Res Function(Prediction) then) =
      _$PredictionCopyWithImpl<$Res, Prediction>;
  @useResult
  $Res call(
      {@JsonKey(name: "description") String? description,
      @JsonKey(name: "matched_substrings")
      List<MatchedSubstring>? matchedSubstrings,
      @JsonKey(name: "place_id") String? placeId,
      @JsonKey(name: "reference") String? reference,
      @JsonKey(name: "structured_formatting")
      StructuredFormatting? structuredFormatting,
      @JsonKey(name: "terms") List<Term>? terms,
      @JsonKey(name: "types") List<String>? types});

  $StructuredFormattingCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class _$PredictionCopyWithImpl<$Res, $Val extends Prediction>
    implements $PredictionCopyWith<$Res> {
  _$PredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? matchedSubstrings = freezed,
    Object? placeId = freezed,
    Object? reference = freezed,
    Object? structuredFormatting = freezed,
    Object? terms = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      matchedSubstrings: freezed == matchedSubstrings
          ? _value.matchedSubstrings
          : matchedSubstrings // ignore: cast_nullable_to_non_nullable
              as List<MatchedSubstring>?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      structuredFormatting: freezed == structuredFormatting
          ? _value.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as StructuredFormatting?,
      terms: freezed == terms
          ? _value.terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<Term>?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StructuredFormattingCopyWith<$Res>? get structuredFormatting {
    if (_value.structuredFormatting == null) {
      return null;
    }

    return $StructuredFormattingCopyWith<$Res>(_value.structuredFormatting!,
        (value) {
      return _then(_value.copyWith(structuredFormatting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PredictionImplCopyWith<$Res>
    implements $PredictionCopyWith<$Res> {
  factory _$$PredictionImplCopyWith(
          _$PredictionImpl value, $Res Function(_$PredictionImpl) then) =
      __$$PredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "description") String? description,
      @JsonKey(name: "matched_substrings")
      List<MatchedSubstring>? matchedSubstrings,
      @JsonKey(name: "place_id") String? placeId,
      @JsonKey(name: "reference") String? reference,
      @JsonKey(name: "structured_formatting")
      StructuredFormatting? structuredFormatting,
      @JsonKey(name: "terms") List<Term>? terms,
      @JsonKey(name: "types") List<String>? types});

  @override
  $StructuredFormattingCopyWith<$Res>? get structuredFormatting;
}

/// @nodoc
class __$$PredictionImplCopyWithImpl<$Res>
    extends _$PredictionCopyWithImpl<$Res, _$PredictionImpl>
    implements _$$PredictionImplCopyWith<$Res> {
  __$$PredictionImplCopyWithImpl(
      _$PredictionImpl _value, $Res Function(_$PredictionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = freezed,
    Object? matchedSubstrings = freezed,
    Object? placeId = freezed,
    Object? reference = freezed,
    Object? structuredFormatting = freezed,
    Object? terms = freezed,
    Object? types = freezed,
  }) {
    return _then(_$PredictionImpl(
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      matchedSubstrings: freezed == matchedSubstrings
          ? _value._matchedSubstrings
          : matchedSubstrings // ignore: cast_nullable_to_non_nullable
              as List<MatchedSubstring>?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
      structuredFormatting: freezed == structuredFormatting
          ? _value.structuredFormatting
          : structuredFormatting // ignore: cast_nullable_to_non_nullable
              as StructuredFormatting?,
      terms: freezed == terms
          ? _value._terms
          : terms // ignore: cast_nullable_to_non_nullable
              as List<Term>?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PredictionImpl implements _Prediction {
  const _$PredictionImpl(
      {@JsonKey(name: "description") this.description,
      @JsonKey(name: "matched_substrings")
      final List<MatchedSubstring>? matchedSubstrings,
      @JsonKey(name: "place_id") this.placeId,
      @JsonKey(name: "reference") this.reference,
      @JsonKey(name: "structured_formatting") this.structuredFormatting,
      @JsonKey(name: "terms") final List<Term>? terms,
      @JsonKey(name: "types") final List<String>? types})
      : _matchedSubstrings = matchedSubstrings,
        _terms = terms,
        _types = types;

  factory _$PredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PredictionImplFromJson(json);

  @override
  @JsonKey(name: "description")
  final String? description;
  final List<MatchedSubstring>? _matchedSubstrings;
  @override
  @JsonKey(name: "matched_substrings")
  List<MatchedSubstring>? get matchedSubstrings {
    final value = _matchedSubstrings;
    if (value == null) return null;
    if (_matchedSubstrings is EqualUnmodifiableListView)
      return _matchedSubstrings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "place_id")
  final String? placeId;
  @override
  @JsonKey(name: "reference")
  final String? reference;
  @override
  @JsonKey(name: "structured_formatting")
  final StructuredFormatting? structuredFormatting;
  final List<Term>? _terms;
  @override
  @JsonKey(name: "terms")
  List<Term>? get terms {
    final value = _terms;
    if (value == null) return null;
    if (_terms is EqualUnmodifiableListView) return _terms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _types;
  @override
  @JsonKey(name: "types")
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Prediction(description: $description, matchedSubstrings: $matchedSubstrings, placeId: $placeId, reference: $reference, structuredFormatting: $structuredFormatting, terms: $terms, types: $types)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PredictionImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._matchedSubstrings, _matchedSubstrings) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.structuredFormatting, structuredFormatting) ||
                other.structuredFormatting == structuredFormatting) &&
            const DeepCollectionEquality().equals(other._terms, _terms) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      const DeepCollectionEquality().hash(_matchedSubstrings),
      placeId,
      reference,
      structuredFormatting,
      const DeepCollectionEquality().hash(_terms),
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PredictionImplCopyWith<_$PredictionImpl> get copyWith =>
      __$$PredictionImplCopyWithImpl<_$PredictionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PredictionImplToJson(
      this,
    );
  }
}

abstract class _Prediction implements Prediction {
  const factory _Prediction(
      {@JsonKey(name: "description") final String? description,
      @JsonKey(name: "matched_substrings")
      final List<MatchedSubstring>? matchedSubstrings,
      @JsonKey(name: "place_id") final String? placeId,
      @JsonKey(name: "reference") final String? reference,
      @JsonKey(name: "structured_formatting")
      final StructuredFormatting? structuredFormatting,
      @JsonKey(name: "terms") final List<Term>? terms,
      @JsonKey(name: "types") final List<String>? types}) = _$PredictionImpl;

  factory _Prediction.fromJson(Map<String, dynamic> json) =
      _$PredictionImpl.fromJson;

  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "matched_substrings")
  List<MatchedSubstring>? get matchedSubstrings;
  @override
  @JsonKey(name: "place_id")
  String? get placeId;
  @override
  @JsonKey(name: "reference")
  String? get reference;
  @override
  @JsonKey(name: "structured_formatting")
  StructuredFormatting? get structuredFormatting;
  @override
  @JsonKey(name: "terms")
  List<Term>? get terms;
  @override
  @JsonKey(name: "types")
  List<String>? get types;
  @override
  @JsonKey(ignore: true)
  _$$PredictionImplCopyWith<_$PredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchedSubstring _$MatchedSubstringFromJson(Map<String, dynamic> json) {
  return _MatchedSubstring.fromJson(json);
}

/// @nodoc
mixin _$MatchedSubstring {
  @JsonKey(name: "length")
  int? get length => throw _privateConstructorUsedError;
  @JsonKey(name: "offset")
  int? get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchedSubstringCopyWith<MatchedSubstring> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchedSubstringCopyWith<$Res> {
  factory $MatchedSubstringCopyWith(
          MatchedSubstring value, $Res Function(MatchedSubstring) then) =
      _$MatchedSubstringCopyWithImpl<$Res, MatchedSubstring>;
  @useResult
  $Res call(
      {@JsonKey(name: "length") int? length,
      @JsonKey(name: "offset") int? offset});
}

/// @nodoc
class _$MatchedSubstringCopyWithImpl<$Res, $Val extends MatchedSubstring>
    implements $MatchedSubstringCopyWith<$Res> {
  _$MatchedSubstringCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = freezed,
    Object? offset = freezed,
  }) {
    return _then(_value.copyWith(
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchedSubstringImplCopyWith<$Res>
    implements $MatchedSubstringCopyWith<$Res> {
  factory _$$MatchedSubstringImplCopyWith(_$MatchedSubstringImpl value,
          $Res Function(_$MatchedSubstringImpl) then) =
      __$$MatchedSubstringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "length") int? length,
      @JsonKey(name: "offset") int? offset});
}

/// @nodoc
class __$$MatchedSubstringImplCopyWithImpl<$Res>
    extends _$MatchedSubstringCopyWithImpl<$Res, _$MatchedSubstringImpl>
    implements _$$MatchedSubstringImplCopyWith<$Res> {
  __$$MatchedSubstringImplCopyWithImpl(_$MatchedSubstringImpl _value,
      $Res Function(_$MatchedSubstringImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? length = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$MatchedSubstringImpl(
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchedSubstringImpl implements _MatchedSubstring {
  const _$MatchedSubstringImpl(
      {@JsonKey(name: "length") this.length,
      @JsonKey(name: "offset") this.offset});

  factory _$MatchedSubstringImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchedSubstringImplFromJson(json);

  @override
  @JsonKey(name: "length")
  final int? length;
  @override
  @JsonKey(name: "offset")
  final int? offset;

  @override
  String toString() {
    return 'MatchedSubstring(length: $length, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchedSubstringImpl &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, length, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchedSubstringImplCopyWith<_$MatchedSubstringImpl> get copyWith =>
      __$$MatchedSubstringImplCopyWithImpl<_$MatchedSubstringImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchedSubstringImplToJson(
      this,
    );
  }
}

abstract class _MatchedSubstring implements MatchedSubstring {
  const factory _MatchedSubstring(
      {@JsonKey(name: "length") final int? length,
      @JsonKey(name: "offset") final int? offset}) = _$MatchedSubstringImpl;

  factory _MatchedSubstring.fromJson(Map<String, dynamic> json) =
      _$MatchedSubstringImpl.fromJson;

  @override
  @JsonKey(name: "length")
  int? get length;
  @override
  @JsonKey(name: "offset")
  int? get offset;
  @override
  @JsonKey(ignore: true)
  _$$MatchedSubstringImplCopyWith<_$MatchedSubstringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StructuredFormatting _$StructuredFormattingFromJson(Map<String, dynamic> json) {
  return _StructuredFormatting.fromJson(json);
}

/// @nodoc
mixin _$StructuredFormatting {
  @JsonKey(name: "main_text")
  String? get mainText => throw _privateConstructorUsedError;
  @JsonKey(name: "main_text_matched_substrings")
  List<MatchedSubstring>? get mainTextMatchedSubstrings =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "secondary_text")
  String? get secondaryText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StructuredFormattingCopyWith<StructuredFormatting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StructuredFormattingCopyWith<$Res> {
  factory $StructuredFormattingCopyWith(StructuredFormatting value,
          $Res Function(StructuredFormatting) then) =
      _$StructuredFormattingCopyWithImpl<$Res, StructuredFormatting>;
  @useResult
  $Res call(
      {@JsonKey(name: "main_text") String? mainText,
      @JsonKey(name: "main_text_matched_substrings")
      List<MatchedSubstring>? mainTextMatchedSubstrings,
      @JsonKey(name: "secondary_text") String? secondaryText});
}

/// @nodoc
class _$StructuredFormattingCopyWithImpl<$Res,
        $Val extends StructuredFormatting>
    implements $StructuredFormattingCopyWith<$Res> {
  _$StructuredFormattingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
    Object? mainTextMatchedSubstrings = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_value.copyWith(
      mainText: freezed == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      mainTextMatchedSubstrings: freezed == mainTextMatchedSubstrings
          ? _value.mainTextMatchedSubstrings
          : mainTextMatchedSubstrings // ignore: cast_nullable_to_non_nullable
              as List<MatchedSubstring>?,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StructuredFormattingImplCopyWith<$Res>
    implements $StructuredFormattingCopyWith<$Res> {
  factory _$$StructuredFormattingImplCopyWith(_$StructuredFormattingImpl value,
          $Res Function(_$StructuredFormattingImpl) then) =
      __$$StructuredFormattingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "main_text") String? mainText,
      @JsonKey(name: "main_text_matched_substrings")
      List<MatchedSubstring>? mainTextMatchedSubstrings,
      @JsonKey(name: "secondary_text") String? secondaryText});
}

/// @nodoc
class __$$StructuredFormattingImplCopyWithImpl<$Res>
    extends _$StructuredFormattingCopyWithImpl<$Res, _$StructuredFormattingImpl>
    implements _$$StructuredFormattingImplCopyWith<$Res> {
  __$$StructuredFormattingImplCopyWithImpl(_$StructuredFormattingImpl _value,
      $Res Function(_$StructuredFormattingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
    Object? mainTextMatchedSubstrings = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_$StructuredFormattingImpl(
      mainText: freezed == mainText
          ? _value.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as String?,
      mainTextMatchedSubstrings: freezed == mainTextMatchedSubstrings
          ? _value._mainTextMatchedSubstrings
          : mainTextMatchedSubstrings // ignore: cast_nullable_to_non_nullable
              as List<MatchedSubstring>?,
      secondaryText: freezed == secondaryText
          ? _value.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StructuredFormattingImpl implements _StructuredFormatting {
  const _$StructuredFormattingImpl(
      {@JsonKey(name: "main_text") this.mainText,
      @JsonKey(name: "main_text_matched_substrings")
      final List<MatchedSubstring>? mainTextMatchedSubstrings,
      @JsonKey(name: "secondary_text") this.secondaryText})
      : _mainTextMatchedSubstrings = mainTextMatchedSubstrings;

  factory _$StructuredFormattingImpl.fromJson(Map<String, dynamic> json) =>
      _$$StructuredFormattingImplFromJson(json);

  @override
  @JsonKey(name: "main_text")
  final String? mainText;
  final List<MatchedSubstring>? _mainTextMatchedSubstrings;
  @override
  @JsonKey(name: "main_text_matched_substrings")
  List<MatchedSubstring>? get mainTextMatchedSubstrings {
    final value = _mainTextMatchedSubstrings;
    if (value == null) return null;
    if (_mainTextMatchedSubstrings is EqualUnmodifiableListView)
      return _mainTextMatchedSubstrings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "secondary_text")
  final String? secondaryText;

  @override
  String toString() {
    return 'StructuredFormatting(mainText: $mainText, mainTextMatchedSubstrings: $mainTextMatchedSubstrings, secondaryText: $secondaryText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StructuredFormattingImpl &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            const DeepCollectionEquality().equals(
                other._mainTextMatchedSubstrings, _mainTextMatchedSubstrings) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mainText,
      const DeepCollectionEquality().hash(_mainTextMatchedSubstrings),
      secondaryText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StructuredFormattingImplCopyWith<_$StructuredFormattingImpl>
      get copyWith =>
          __$$StructuredFormattingImplCopyWithImpl<_$StructuredFormattingImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StructuredFormattingImplToJson(
      this,
    );
  }
}

abstract class _StructuredFormatting implements StructuredFormatting {
  const factory _StructuredFormatting(
          {@JsonKey(name: "main_text") final String? mainText,
          @JsonKey(name: "main_text_matched_substrings")
          final List<MatchedSubstring>? mainTextMatchedSubstrings,
          @JsonKey(name: "secondary_text") final String? secondaryText}) =
      _$StructuredFormattingImpl;

  factory _StructuredFormatting.fromJson(Map<String, dynamic> json) =
      _$StructuredFormattingImpl.fromJson;

  @override
  @JsonKey(name: "main_text")
  String? get mainText;
  @override
  @JsonKey(name: "main_text_matched_substrings")
  List<MatchedSubstring>? get mainTextMatchedSubstrings;
  @override
  @JsonKey(name: "secondary_text")
  String? get secondaryText;
  @override
  @JsonKey(ignore: true)
  _$$StructuredFormattingImplCopyWith<_$StructuredFormattingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

Term _$TermFromJson(Map<String, dynamic> json) {
  return _Term.fromJson(json);
}

/// @nodoc
mixin _$Term {
  @JsonKey(name: "offset")
  int? get offset => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String? get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TermCopyWith<Term> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermCopyWith<$Res> {
  factory $TermCopyWith(Term value, $Res Function(Term) then) =
      _$TermCopyWithImpl<$Res, Term>;
  @useResult
  $Res call(
      {@JsonKey(name: "offset") int? offset,
      @JsonKey(name: "value") String? value});
}

/// @nodoc
class _$TermCopyWithImpl<$Res, $Val extends Term>
    implements $TermCopyWith<$Res> {
  _$TermCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermImplCopyWith<$Res> implements $TermCopyWith<$Res> {
  factory _$$TermImplCopyWith(
          _$TermImpl value, $Res Function(_$TermImpl) then) =
      __$$TermImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "offset") int? offset,
      @JsonKey(name: "value") String? value});
}

/// @nodoc
class __$$TermImplCopyWithImpl<$Res>
    extends _$TermCopyWithImpl<$Res, _$TermImpl>
    implements _$$TermImplCopyWith<$Res> {
  __$$TermImplCopyWithImpl(_$TermImpl _value, $Res Function(_$TermImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = freezed,
    Object? value = freezed,
  }) {
    return _then(_$TermImpl(
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TermImpl implements _Term {
  const _$TermImpl(
      {@JsonKey(name: "offset") this.offset,
      @JsonKey(name: "value") this.value});

  factory _$TermImpl.fromJson(Map<String, dynamic> json) =>
      _$$TermImplFromJson(json);

  @override
  @JsonKey(name: "offset")
  final int? offset;
  @override
  @JsonKey(name: "value")
  final String? value;

  @override
  String toString() {
    return 'Term(offset: $offset, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, offset, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TermImplCopyWith<_$TermImpl> get copyWith =>
      __$$TermImplCopyWithImpl<_$TermImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TermImplToJson(
      this,
    );
  }
}

abstract class _Term implements Term {
  const factory _Term(
      {@JsonKey(name: "offset") final int? offset,
      @JsonKey(name: "value") final String? value}) = _$TermImpl;

  factory _Term.fromJson(Map<String, dynamic> json) = _$TermImpl.fromJson;

  @override
  @JsonKey(name: "offset")
  int? get offset;
  @override
  @JsonKey(name: "value")
  String? get value;
  @override
  @JsonKey(ignore: true)
  _$$TermImplCopyWith<_$TermImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
