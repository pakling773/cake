// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cake_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CakeModel _$CakeModelFromJson(Map<String, dynamic> json) {
  return _CakeModel.fromJson(json);
}

/// @nodoc
mixin _$CakeModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "category_id")
  String? get categoryId => throw _privateConstructorUsedError;
  @JsonKey(name: "featured")
  bool? get featured => throw _privateConstructorUsedError;
  @JsonKey(name: "flavour_id")
  String? get flavourId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "photo")
  String? get photo => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "shop_id")
  String? get shopId => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "specification")
  String? get specification => throw _privateConstructorUsedError;
  @JsonKey(name: "isFav")
  bool? get isFav => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CakeModelCopyWith<CakeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CakeModelCopyWith<$Res> {
  factory $CakeModelCopyWith(CakeModel value, $Res Function(CakeModel) then) =
      _$CakeModelCopyWithImpl<$Res, CakeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "category_id") String? categoryId,
      @JsonKey(name: "featured") bool? featured,
      @JsonKey(name: "flavour_id") String? flavourId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "photo") String? photo,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "shop_id") String? shopId,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "specification") String? specification,
      @JsonKey(name: "isFav") bool? isFav});
}

/// @nodoc
class _$CakeModelCopyWithImpl<$Res, $Val extends CakeModel>
    implements $CakeModelCopyWith<$Res> {
  _$CakeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? featured = freezed,
    Object? flavourId = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? price = freezed,
    Object? shopId = freezed,
    Object? description = freezed,
    Object? specification = freezed,
    Object? isFav = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      flavourId: freezed == flavourId
          ? _value.flavourId
          : flavourId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specification: freezed == specification
          ? _value.specification
          : specification // ignore: cast_nullable_to_non_nullable
              as String?,
      isFav: freezed == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CakeModelImplCopyWith<$Res>
    implements $CakeModelCopyWith<$Res> {
  factory _$$CakeModelImplCopyWith(
          _$CakeModelImpl value, $Res Function(_$CakeModelImpl) then) =
      __$$CakeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "category_id") String? categoryId,
      @JsonKey(name: "featured") bool? featured,
      @JsonKey(name: "flavour_id") String? flavourId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "photo") String? photo,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "shop_id") String? shopId,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "specification") String? specification,
      @JsonKey(name: "isFav") bool? isFav});
}

/// @nodoc
class __$$CakeModelImplCopyWithImpl<$Res>
    extends _$CakeModelCopyWithImpl<$Res, _$CakeModelImpl>
    implements _$$CakeModelImplCopyWith<$Res> {
  __$$CakeModelImplCopyWithImpl(
      _$CakeModelImpl _value, $Res Function(_$CakeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? categoryId = freezed,
    Object? featured = freezed,
    Object? flavourId = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? price = freezed,
    Object? shopId = freezed,
    Object? description = freezed,
    Object? specification = freezed,
    Object? isFav = freezed,
  }) {
    return _then(_$CakeModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      featured: freezed == featured
          ? _value.featured
          : featured // ignore: cast_nullable_to_non_nullable
              as bool?,
      flavourId: freezed == flavourId
          ? _value.flavourId
          : flavourId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      shopId: freezed == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specification: freezed == specification
          ? _value.specification
          : specification // ignore: cast_nullable_to_non_nullable
              as String?,
      isFav: freezed == isFav
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CakeModelImpl extends _CakeModel {
  const _$CakeModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "category_id") this.categoryId,
      @JsonKey(name: "featured") this.featured,
      @JsonKey(name: "flavour_id") this.flavourId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "photo") this.photo,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "shop_id") this.shopId,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "specification") this.specification,
      @JsonKey(name: "isFav") this.isFav})
      : super._();

  factory _$CakeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CakeModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "category_id")
  final String? categoryId;
  @override
  @JsonKey(name: "featured")
  final bool? featured;
  @override
  @JsonKey(name: "flavour_id")
  final String? flavourId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "photo")
  final String? photo;
  @override
  @JsonKey(name: "price")
  final int? price;
  @override
  @JsonKey(name: "shop_id")
  final String? shopId;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "specification")
  final String? specification;
  @override
  @JsonKey(name: "isFav")
  final bool? isFav;

  @override
  String toString() {
    return 'CakeModel(id: $id, categoryId: $categoryId, featured: $featured, flavourId: $flavourId, name: $name, photo: $photo, price: $price, shopId: $shopId, description: $description, specification: $specification, isFav: $isFav)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CakeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.featured, featured) ||
                other.featured == featured) &&
            (identical(other.flavourId, flavourId) ||
                other.flavourId == flavourId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.specification, specification) ||
                other.specification == specification) &&
            (identical(other.isFav, isFav) || other.isFav == isFav));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, categoryId, featured,
      flavourId, name, photo, price, shopId, description, specification, isFav);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CakeModelImplCopyWith<_$CakeModelImpl> get copyWith =>
      __$$CakeModelImplCopyWithImpl<_$CakeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CakeModelImplToJson(
      this,
    );
  }
}

abstract class _CakeModel extends CakeModel {
  const factory _CakeModel(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "category_id") final String? categoryId,
      @JsonKey(name: "featured") final bool? featured,
      @JsonKey(name: "flavour_id") final String? flavourId,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "photo") final String? photo,
      @JsonKey(name: "price") final int? price,
      @JsonKey(name: "shop_id") final String? shopId,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "specification") final String? specification,
      @JsonKey(name: "isFav") final bool? isFav}) = _$CakeModelImpl;
  const _CakeModel._() : super._();

  factory _CakeModel.fromJson(Map<String, dynamic> json) =
      _$CakeModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "category_id")
  String? get categoryId;
  @override
  @JsonKey(name: "featured")
  bool? get featured;
  @override
  @JsonKey(name: "flavour_id")
  String? get flavourId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "photo")
  String? get photo;
  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "shop_id")
  String? get shopId;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "specification")
  String? get specification;
  @override
  @JsonKey(name: "isFav")
  bool? get isFav;
  @override
  @JsonKey(ignore: true)
  _$$CakeModelImplCopyWith<_$CakeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
