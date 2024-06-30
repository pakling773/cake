// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderSummaryRequestModel _$OrderSummaryRequestModelFromJson(
    Map<String, dynamic> json) {
  return _OrderSummaryRequestModel.fromJson(json);
}

/// @nodoc
mixin _$OrderSummaryRequestModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_info")
  PaymentInfo? get paymentInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "shipping_info")
  ShippingInfo? get shippingInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "order_summary")
  OrderDetailsSummary? get orderSummary => throw _privateConstructorUsedError;
  @JsonKey(name: "cart")
  List<CartModel>? get cart => throw _privateConstructorUsedError;
  @JsonKey(name: "points")
  num? get points => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderSummaryRequestModelCopyWith<OrderSummaryRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSummaryRequestModelCopyWith<$Res> {
  factory $OrderSummaryRequestModelCopyWith(OrderSummaryRequestModel value,
          $Res Function(OrderSummaryRequestModel) then) =
      _$OrderSummaryRequestModelCopyWithImpl<$Res, OrderSummaryRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "payment_info") PaymentInfo? paymentInfo,
      @JsonKey(name: "shipping_info") ShippingInfo? shippingInfo,
      @JsonKey(name: "order_summary") OrderDetailsSummary? orderSummary,
      @JsonKey(name: "cart") List<CartModel>? cart,
      @JsonKey(name: "points") num? points});

  $PaymentInfoCopyWith<$Res>? get paymentInfo;
  $ShippingInfoCopyWith<$Res>? get shippingInfo;
  $OrderDetailsSummaryCopyWith<$Res>? get orderSummary;
}

/// @nodoc
class _$OrderSummaryRequestModelCopyWithImpl<$Res,
        $Val extends OrderSummaryRequestModel>
    implements $OrderSummaryRequestModelCopyWith<$Res> {
  _$OrderSummaryRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? paymentInfo = freezed,
    Object? shippingInfo = freezed,
    Object? orderSummary = freezed,
    Object? cart = freezed,
    Object? points = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInfo: freezed == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      shippingInfo: freezed == shippingInfo
          ? _value.shippingInfo
          : shippingInfo // ignore: cast_nullable_to_non_nullable
              as ShippingInfo?,
      orderSummary: freezed == orderSummary
          ? _value.orderSummary
          : orderSummary // ignore: cast_nullable_to_non_nullable
              as OrderDetailsSummary?,
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartModel>?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentInfoCopyWith<$Res>? get paymentInfo {
    if (_value.paymentInfo == null) {
      return null;
    }

    return $PaymentInfoCopyWith<$Res>(_value.paymentInfo!, (value) {
      return _then(_value.copyWith(paymentInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ShippingInfoCopyWith<$Res>? get shippingInfo {
    if (_value.shippingInfo == null) {
      return null;
    }

    return $ShippingInfoCopyWith<$Res>(_value.shippingInfo!, (value) {
      return _then(_value.copyWith(shippingInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrderDetailsSummaryCopyWith<$Res>? get orderSummary {
    if (_value.orderSummary == null) {
      return null;
    }

    return $OrderDetailsSummaryCopyWith<$Res>(_value.orderSummary!, (value) {
      return _then(_value.copyWith(orderSummary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderSummaryRequestModelImplCopyWith<$Res>
    implements $OrderSummaryRequestModelCopyWith<$Res> {
  factory _$$OrderSummaryRequestModelImplCopyWith(
          _$OrderSummaryRequestModelImpl value,
          $Res Function(_$OrderSummaryRequestModelImpl) then) =
      __$$OrderSummaryRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "payment_info") PaymentInfo? paymentInfo,
      @JsonKey(name: "shipping_info") ShippingInfo? shippingInfo,
      @JsonKey(name: "order_summary") OrderDetailsSummary? orderSummary,
      @JsonKey(name: "cart") List<CartModel>? cart,
      @JsonKey(name: "points") num? points});

  @override
  $PaymentInfoCopyWith<$Res>? get paymentInfo;
  @override
  $ShippingInfoCopyWith<$Res>? get shippingInfo;
  @override
  $OrderDetailsSummaryCopyWith<$Res>? get orderSummary;
}

/// @nodoc
class __$$OrderSummaryRequestModelImplCopyWithImpl<$Res>
    extends _$OrderSummaryRequestModelCopyWithImpl<$Res,
        _$OrderSummaryRequestModelImpl>
    implements _$$OrderSummaryRequestModelImplCopyWith<$Res> {
  __$$OrderSummaryRequestModelImplCopyWithImpl(
      _$OrderSummaryRequestModelImpl _value,
      $Res Function(_$OrderSummaryRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? paymentInfo = freezed,
    Object? shippingInfo = freezed,
    Object? orderSummary = freezed,
    Object? cart = freezed,
    Object? points = freezed,
  }) {
    return _then(_$OrderSummaryRequestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentInfo: freezed == paymentInfo
          ? _value.paymentInfo
          : paymentInfo // ignore: cast_nullable_to_non_nullable
              as PaymentInfo?,
      shippingInfo: freezed == shippingInfo
          ? _value.shippingInfo
          : shippingInfo // ignore: cast_nullable_to_non_nullable
              as ShippingInfo?,
      orderSummary: freezed == orderSummary
          ? _value.orderSummary
          : orderSummary // ignore: cast_nullable_to_non_nullable
              as OrderDetailsSummary?,
      cart: freezed == cart
          ? _value._cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartModel>?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderSummaryRequestModelImpl implements _OrderSummaryRequestModel {
  const _$OrderSummaryRequestModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "payment_info") this.paymentInfo,
      @JsonKey(name: "shipping_info") this.shippingInfo,
      @JsonKey(name: "order_summary") this.orderSummary,
      @JsonKey(name: "cart") final List<CartModel>? cart,
      @JsonKey(name: "points") this.points})
      : _cart = cart;

  factory _$OrderSummaryRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderSummaryRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "payment_info")
  final PaymentInfo? paymentInfo;
  @override
  @JsonKey(name: "shipping_info")
  final ShippingInfo? shippingInfo;
  @override
  @JsonKey(name: "order_summary")
  final OrderDetailsSummary? orderSummary;
  final List<CartModel>? _cart;
  @override
  @JsonKey(name: "cart")
  List<CartModel>? get cart {
    final value = _cart;
    if (value == null) return null;
    if (_cart is EqualUnmodifiableListView) return _cart;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "points")
  final num? points;

  @override
  String toString() {
    return 'OrderSummaryRequestModel(id: $id, userId: $userId, paymentInfo: $paymentInfo, shippingInfo: $shippingInfo, orderSummary: $orderSummary, cart: $cart, points: $points)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderSummaryRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.paymentInfo, paymentInfo) ||
                other.paymentInfo == paymentInfo) &&
            (identical(other.shippingInfo, shippingInfo) ||
                other.shippingInfo == shippingInfo) &&
            (identical(other.orderSummary, orderSummary) ||
                other.orderSummary == orderSummary) &&
            const DeepCollectionEquality().equals(other._cart, _cart) &&
            (identical(other.points, points) || other.points == points));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      paymentInfo,
      shippingInfo,
      orderSummary,
      const DeepCollectionEquality().hash(_cart),
      points);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderSummaryRequestModelImplCopyWith<_$OrderSummaryRequestModelImpl>
      get copyWith => __$$OrderSummaryRequestModelImplCopyWithImpl<
          _$OrderSummaryRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderSummaryRequestModelImplToJson(
      this,
    );
  }
}

abstract class _OrderSummaryRequestModel implements OrderSummaryRequestModel {
  const factory _OrderSummaryRequestModel(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "payment_info") final PaymentInfo? paymentInfo,
      @JsonKey(name: "shipping_info") final ShippingInfo? shippingInfo,
      @JsonKey(name: "order_summary") final OrderDetailsSummary? orderSummary,
      @JsonKey(name: "cart") final List<CartModel>? cart,
      @JsonKey(name: "points")
      final num? points}) = _$OrderSummaryRequestModelImpl;

  factory _OrderSummaryRequestModel.fromJson(Map<String, dynamic> json) =
      _$OrderSummaryRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "payment_info")
  PaymentInfo? get paymentInfo;
  @override
  @JsonKey(name: "shipping_info")
  ShippingInfo? get shippingInfo;
  @override
  @JsonKey(name: "order_summary")
  OrderDetailsSummary? get orderSummary;
  @override
  @JsonKey(name: "cart")
  List<CartModel>? get cart;
  @override
  @JsonKey(name: "points")
  num? get points;
  @override
  @JsonKey(ignore: true)
  _$$OrderSummaryRequestModelImplCopyWith<_$OrderSummaryRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OrderDetailsSummary _$OrderDetailsSummaryFromJson(Map<String, dynamic> json) {
  return _OrderDetailsSummary.fromJson(json);
}

/// @nodoc
mixin _$OrderDetailsSummary {
  @JsonKey(name: "quantity")
  int? get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "subtotal")
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: "delivery_charge")
  double? get deliveryCharge => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  double? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsSummaryCopyWith<OrderDetailsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsSummaryCopyWith<$Res> {
  factory $OrderDetailsSummaryCopyWith(
          OrderDetailsSummary value, $Res Function(OrderDetailsSummary) then) =
      _$OrderDetailsSummaryCopyWithImpl<$Res, OrderDetailsSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: "quantity") int? quantity,
      @JsonKey(name: "subtotal") double? subtotal,
      @JsonKey(name: "delivery_charge") double? deliveryCharge,
      @JsonKey(name: "total") double? total});
}

/// @nodoc
class _$OrderDetailsSummaryCopyWithImpl<$Res, $Val extends OrderDetailsSummary>
    implements $OrderDetailsSummaryCopyWith<$Res> {
  _$OrderDetailsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? subtotal = freezed,
    Object? deliveryCharge = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailsSummaryImplCopyWith<$Res>
    implements $OrderDetailsSummaryCopyWith<$Res> {
  factory _$$OrderDetailsSummaryImplCopyWith(_$OrderDetailsSummaryImpl value,
          $Res Function(_$OrderDetailsSummaryImpl) then) =
      __$$OrderDetailsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "quantity") int? quantity,
      @JsonKey(name: "subtotal") double? subtotal,
      @JsonKey(name: "delivery_charge") double? deliveryCharge,
      @JsonKey(name: "total") double? total});
}

/// @nodoc
class __$$OrderDetailsSummaryImplCopyWithImpl<$Res>
    extends _$OrderDetailsSummaryCopyWithImpl<$Res, _$OrderDetailsSummaryImpl>
    implements _$$OrderDetailsSummaryImplCopyWith<$Res> {
  __$$OrderDetailsSummaryImplCopyWithImpl(_$OrderDetailsSummaryImpl _value,
      $Res Function(_$OrderDetailsSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = freezed,
    Object? subtotal = freezed,
    Object? deliveryCharge = freezed,
    Object? total = freezed,
  }) {
    return _then(_$OrderDetailsSummaryImpl(
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$OrderDetailsSummaryImpl implements _OrderDetailsSummary {
  const _$OrderDetailsSummaryImpl(
      {@JsonKey(name: "quantity") this.quantity,
      @JsonKey(name: "subtotal") this.subtotal,
      @JsonKey(name: "delivery_charge") this.deliveryCharge,
      @JsonKey(name: "total") this.total});

  factory _$OrderDetailsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailsSummaryImplFromJson(json);

  @override
  @JsonKey(name: "quantity")
  final int? quantity;
  @override
  @JsonKey(name: "subtotal")
  final double? subtotal;
  @override
  @JsonKey(name: "delivery_charge")
  final double? deliveryCharge;
  @override
  @JsonKey(name: "total")
  final double? total;

  @override
  String toString() {
    return 'OrderDetailsSummary(quantity: $quantity, subtotal: $subtotal, deliveryCharge: $deliveryCharge, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailsSummaryImpl &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, quantity, subtotal, deliveryCharge, total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailsSummaryImplCopyWith<_$OrderDetailsSummaryImpl> get copyWith =>
      __$$OrderDetailsSummaryImplCopyWithImpl<_$OrderDetailsSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailsSummaryImplToJson(
      this,
    );
  }
}

abstract class _OrderDetailsSummary implements OrderDetailsSummary {
  const factory _OrderDetailsSummary(
      {@JsonKey(name: "quantity") final int? quantity,
      @JsonKey(name: "subtotal") final double? subtotal,
      @JsonKey(name: "delivery_charge") final double? deliveryCharge,
      @JsonKey(name: "total") final double? total}) = _$OrderDetailsSummaryImpl;

  factory _OrderDetailsSummary.fromJson(Map<String, dynamic> json) =
      _$OrderDetailsSummaryImpl.fromJson;

  @override
  @JsonKey(name: "quantity")
  int? get quantity;
  @override
  @JsonKey(name: "subtotal")
  double? get subtotal;
  @override
  @JsonKey(name: "delivery_charge")
  double? get deliveryCharge;
  @override
  @JsonKey(name: "total")
  double? get total;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailsSummaryImplCopyWith<_$OrderDetailsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) {
  return _PaymentInfo.fromJson(json);
}

/// @nodoc
mixin _$PaymentInfo {
  @JsonKey(name: "mayment_method")
  String? get maymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: "account_number")
  String? get accountNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentInfoCopyWith<PaymentInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentInfoCopyWith<$Res> {
  factory $PaymentInfoCopyWith(
          PaymentInfo value, $Res Function(PaymentInfo) then) =
      _$PaymentInfoCopyWithImpl<$Res, PaymentInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "mayment_method") String? maymentMethod,
      @JsonKey(name: "account_number") String? accountNumber});
}

/// @nodoc
class _$PaymentInfoCopyWithImpl<$Res, $Val extends PaymentInfo>
    implements $PaymentInfoCopyWith<$Res> {
  _$PaymentInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maymentMethod = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_value.copyWith(
      maymentMethod: freezed == maymentMethod
          ? _value.maymentMethod
          : maymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentInfoImplCopyWith<$Res>
    implements $PaymentInfoCopyWith<$Res> {
  factory _$$PaymentInfoImplCopyWith(
          _$PaymentInfoImpl value, $Res Function(_$PaymentInfoImpl) then) =
      __$$PaymentInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "mayment_method") String? maymentMethod,
      @JsonKey(name: "account_number") String? accountNumber});
}

/// @nodoc
class __$$PaymentInfoImplCopyWithImpl<$Res>
    extends _$PaymentInfoCopyWithImpl<$Res, _$PaymentInfoImpl>
    implements _$$PaymentInfoImplCopyWith<$Res> {
  __$$PaymentInfoImplCopyWithImpl(
      _$PaymentInfoImpl _value, $Res Function(_$PaymentInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maymentMethod = freezed,
    Object? accountNumber = freezed,
  }) {
    return _then(_$PaymentInfoImpl(
      maymentMethod: freezed == maymentMethod
          ? _value.maymentMethod
          : maymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PaymentInfoImpl implements _PaymentInfo {
  const _$PaymentInfoImpl(
      {@JsonKey(name: "mayment_method") this.maymentMethod,
      @JsonKey(name: "account_number") this.accountNumber});

  factory _$PaymentInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentInfoImplFromJson(json);

  @override
  @JsonKey(name: "mayment_method")
  final String? maymentMethod;
  @override
  @JsonKey(name: "account_number")
  final String? accountNumber;

  @override
  String toString() {
    return 'PaymentInfo(maymentMethod: $maymentMethod, accountNumber: $accountNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentInfoImpl &&
            (identical(other.maymentMethod, maymentMethod) ||
                other.maymentMethod == maymentMethod) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, maymentMethod, accountNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      __$$PaymentInfoImplCopyWithImpl<_$PaymentInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentInfoImplToJson(
      this,
    );
  }
}

abstract class _PaymentInfo implements PaymentInfo {
  const factory _PaymentInfo(
          {@JsonKey(name: "mayment_method") final String? maymentMethod,
          @JsonKey(name: "account_number") final String? accountNumber}) =
      _$PaymentInfoImpl;

  factory _PaymentInfo.fromJson(Map<String, dynamic> json) =
      _$PaymentInfoImpl.fromJson;

  @override
  @JsonKey(name: "mayment_method")
  String? get maymentMethod;
  @override
  @JsonKey(name: "account_number")
  String? get accountNumber;
  @override
  @JsonKey(ignore: true)
  _$$PaymentInfoImplCopyWith<_$PaymentInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) {
  return _ShippingInfo.fromJson(json);
}

/// @nodoc
mixin _$ShippingInfo {
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "address_1")
  String? get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: "address_2")
  String? get address2 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShippingInfoCopyWith<ShippingInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingInfoCopyWith<$Res> {
  factory $ShippingInfoCopyWith(
          ShippingInfo value, $Res Function(ShippingInfo) then) =
      _$ShippingInfoCopyWithImpl<$Res, ShippingInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "address_1") String? address1,
      @JsonKey(name: "address_2") String? address2});
}

/// @nodoc
class _$ShippingInfoCopyWithImpl<$Res, $Val extends ShippingInfo>
    implements $ShippingInfoCopyWith<$Res> {
  _$ShippingInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShippingInfoImplCopyWith<$Res>
    implements $ShippingInfoCopyWith<$Res> {
  factory _$$ShippingInfoImplCopyWith(
          _$ShippingInfoImpl value, $Res Function(_$ShippingInfoImpl) then) =
      __$$ShippingInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "name") String? name,
      @JsonKey(name: "address_1") String? address1,
      @JsonKey(name: "address_2") String? address2});
}

/// @nodoc
class __$$ShippingInfoImplCopyWithImpl<$Res>
    extends _$ShippingInfoCopyWithImpl<$Res, _$ShippingInfoImpl>
    implements _$$ShippingInfoImplCopyWith<$Res> {
  __$$ShippingInfoImplCopyWithImpl(
      _$ShippingInfoImpl _value, $Res Function(_$ShippingInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address1 = freezed,
    Object? address2 = freezed,
  }) {
    return _then(_$ShippingInfoImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address1: freezed == address1
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: freezed == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ShippingInfoImpl implements _ShippingInfo {
  const _$ShippingInfoImpl(
      {@JsonKey(name: "name") this.name,
      @JsonKey(name: "address_1") this.address1,
      @JsonKey(name: "address_2") this.address2});

  factory _$ShippingInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingInfoImplFromJson(json);

  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "address_1")
  final String? address1;
  @override
  @JsonKey(name: "address_2")
  final String? address2;

  @override
  String toString() {
    return 'ShippingInfo(name: $name, address1: $address1, address2: $address2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingInfoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, address1, address2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingInfoImplCopyWith<_$ShippingInfoImpl> get copyWith =>
      __$$ShippingInfoImplCopyWithImpl<_$ShippingInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingInfoImplToJson(
      this,
    );
  }
}

abstract class _ShippingInfo implements ShippingInfo {
  const factory _ShippingInfo(
      {@JsonKey(name: "name") final String? name,
      @JsonKey(name: "address_1") final String? address1,
      @JsonKey(name: "address_2") final String? address2}) = _$ShippingInfoImpl;

  factory _ShippingInfo.fromJson(Map<String, dynamic> json) =
      _$ShippingInfoImpl.fromJson;

  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "address_1")
  String? get address1;
  @override
  @JsonKey(name: "address_2")
  String? get address2;
  @override
  @JsonKey(ignore: true)
  _$$ShippingInfoImplCopyWith<_$ShippingInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
