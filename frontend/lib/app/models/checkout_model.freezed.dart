// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckoutModel _$CheckoutModelFromJson(Map<String, dynamic> json) {
  return _CheckoutModel.fromJson(json);
}

/// @nodoc
mixin _$CheckoutModel {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  String? get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "card_number")
  int? get cardNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "expiry_date")
  String? get expiryDate => throw _privateConstructorUsedError;
  @JsonKey(name: "security_code")
  int? get securityCode => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_address1")
  String? get shippingAddress1 => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_address2")
  String? get shippingAddress2 => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  int? get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckoutModelCopyWith<CheckoutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutModelCopyWith<$Res> {
  factory $CheckoutModelCopyWith(
          CheckoutModel value, $Res Function(CheckoutModel) then) =
      _$CheckoutModelCopyWithImpl<$Res, CheckoutModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "payment_method") String? paymentMethod,
      @JsonKey(name: "card_number") int? cardNumber,
      @JsonKey(name: "expiry_date") String? expiryDate,
      @JsonKey(name: "security_code") int? securityCode,
      @JsonKey(name: "shipping_address1") String? shippingAddress1,
      @JsonKey(name: "shipping_address2") String? shippingAddress2,
      @JsonKey(name: "phone_number") int? phoneNumber});
}

/// @nodoc
class _$CheckoutModelCopyWithImpl<$Res, $Val extends CheckoutModel>
    implements $CheckoutModelCopyWith<$Res> {
  _$CheckoutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? paymentMethod = freezed,
    Object? cardNumber = freezed,
    Object? expiryDate = freezed,
    Object? securityCode = freezed,
    Object? shippingAddress1 = freezed,
    Object? shippingAddress2 = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      securityCode: freezed == securityCode
          ? _value.securityCode
          : securityCode // ignore: cast_nullable_to_non_nullable
              as int?,
      shippingAddress1: freezed == shippingAddress1
          ? _value.shippingAddress1
          : shippingAddress1 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress2: freezed == shippingAddress2
          ? _value.shippingAddress2
          : shippingAddress2 // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutModelImplCopyWith<$Res>
    implements $CheckoutModelCopyWith<$Res> {
  factory _$$CheckoutModelImplCopyWith(
          _$CheckoutModelImpl value, $Res Function(_$CheckoutModelImpl) then) =
      __$$CheckoutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "payment_method") String? paymentMethod,
      @JsonKey(name: "card_number") int? cardNumber,
      @JsonKey(name: "expiry_date") String? expiryDate,
      @JsonKey(name: "security_code") int? securityCode,
      @JsonKey(name: "shipping_address1") String? shippingAddress1,
      @JsonKey(name: "shipping_address2") String? shippingAddress2,
      @JsonKey(name: "phone_number") int? phoneNumber});
}

/// @nodoc
class __$$CheckoutModelImplCopyWithImpl<$Res>
    extends _$CheckoutModelCopyWithImpl<$Res, _$CheckoutModelImpl>
    implements _$$CheckoutModelImplCopyWith<$Res> {
  __$$CheckoutModelImplCopyWithImpl(
      _$CheckoutModelImpl _value, $Res Function(_$CheckoutModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? paymentMethod = freezed,
    Object? cardNumber = freezed,
    Object? expiryDate = freezed,
    Object? securityCode = freezed,
    Object? shippingAddress1 = freezed,
    Object? shippingAddress2 = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$CheckoutModelImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      cardNumber: freezed == cardNumber
          ? _value.cardNumber
          : cardNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      securityCode: freezed == securityCode
          ? _value.securityCode
          : securityCode // ignore: cast_nullable_to_non_nullable
              as int?,
      shippingAddress1: freezed == shippingAddress1
          ? _value.shippingAddress1
          : shippingAddress1 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingAddress2: freezed == shippingAddress2
          ? _value.shippingAddress2
          : shippingAddress2 // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckoutModelImpl implements _CheckoutModel {
  const _$CheckoutModelImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "payment_method") this.paymentMethod,
      @JsonKey(name: "card_number") this.cardNumber,
      @JsonKey(name: "expiry_date") this.expiryDate,
      @JsonKey(name: "security_code") this.securityCode,
      @JsonKey(name: "shipping_address1") this.shippingAddress1,
      @JsonKey(name: "shipping_address2") this.shippingAddress2,
      @JsonKey(name: "phone_number") this.phoneNumber});

  factory _$CheckoutModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckoutModelImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "payment_method")
  final String? paymentMethod;
  @override
  @JsonKey(name: "card_number")
  final int? cardNumber;
  @override
  @JsonKey(name: "expiry_date")
  final String? expiryDate;
  @override
  @JsonKey(name: "security_code")
  final int? securityCode;
  @override
  @JsonKey(name: "shipping_address1")
  final String? shippingAddress1;
  @override
  @JsonKey(name: "shipping_address2")
  final String? shippingAddress2;
  @override
  @JsonKey(name: "phone_number")
  final int? phoneNumber;

  @override
  String toString() {
    return 'CheckoutModel(name: $name, paymentMethod: $paymentMethod, cardNumber: $cardNumber, expiryDate: $expiryDate, securityCode: $securityCode, shippingAddress1: $shippingAddress1, shippingAddress2: $shippingAddress2, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.cardNumber, cardNumber) ||
                other.cardNumber == cardNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.securityCode, securityCode) ||
                other.securityCode == securityCode) &&
            (identical(other.shippingAddress1, shippingAddress1) ||
                other.shippingAddress1 == shippingAddress1) &&
            (identical(other.shippingAddress2, shippingAddress2) ||
                other.shippingAddress2 == shippingAddress2) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      paymentMethod,
      cardNumber,
      expiryDate,
      securityCode,
      shippingAddress1,
      shippingAddress2,
      phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutModelImplCopyWith<_$CheckoutModelImpl> get copyWith =>
      __$$CheckoutModelImplCopyWithImpl<_$CheckoutModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckoutModelImplToJson(
      this,
    );
  }
}

abstract class _CheckoutModel implements CheckoutModel {
  const factory _CheckoutModel(
          {@JsonKey(name: "name") final String? name,
          @JsonKey(name: "payment_method") final String? paymentMethod,
          @JsonKey(name: "card_number") final int? cardNumber,
          @JsonKey(name: "expiry_date") final String? expiryDate,
          @JsonKey(name: "security_code") final int? securityCode,
          @JsonKey(name: "shipping_address1") final String? shippingAddress1,
          @JsonKey(name: "shipping_address2") final String? shippingAddress2,
          @JsonKey(name: "phone_number") final int? phoneNumber}) =
      _$CheckoutModelImpl;

  factory _CheckoutModel.fromJson(Map<String, dynamic> json) =
      _$CheckoutModelImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "payment_method")
  String? get paymentMethod;
  @override
  @JsonKey(name: "card_number")
  int? get cardNumber;
  @override
  @JsonKey(name: "expiry_date")
  String? get expiryDate;
  @override
  @JsonKey(name: "security_code")
  int? get securityCode;
  @override
  @JsonKey(name: "shipping_address1")
  String? get shippingAddress1;
  @override
  @JsonKey(name: "shipping_address2")
  String? get shippingAddress2;
  @override
  @JsonKey(name: "phone_number")
  int? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutModelImplCopyWith<_$CheckoutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
