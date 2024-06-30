// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getShopsByIDHash() => r'ef91d855c4bc6b854e85aa2a62c1c1df9ffe57af';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getShopsByID].
@ProviderFor(getShopsByID)
const getShopsByIDProvider = GetShopsByIDFamily();

/// See also [getShopsByID].
class GetShopsByIDFamily extends Family<AsyncValue<ShopModel>> {
  /// See also [getShopsByID].
  const GetShopsByIDFamily();

  /// See also [getShopsByID].
  GetShopsByIDProvider call({
    required String shopID,
  }) {
    return GetShopsByIDProvider(
      shopID: shopID,
    );
  }

  @override
  GetShopsByIDProvider getProviderOverride(
    covariant GetShopsByIDProvider provider,
  ) {
    return call(
      shopID: provider.shopID,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getShopsByIDProvider';
}

/// See also [getShopsByID].
class GetShopsByIDProvider extends FutureProvider<ShopModel> {
  /// See also [getShopsByID].
  GetShopsByIDProvider({
    required String shopID,
  }) : this._internal(
          (ref) => getShopsByID(
            ref as GetShopsByIDRef,
            shopID: shopID,
          ),
          from: getShopsByIDProvider,
          name: r'getShopsByIDProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getShopsByIDHash,
          dependencies: GetShopsByIDFamily._dependencies,
          allTransitiveDependencies:
              GetShopsByIDFamily._allTransitiveDependencies,
          shopID: shopID,
        );

  GetShopsByIDProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopID,
  }) : super.internal();

  final String shopID;

  @override
  Override overrideWith(
    FutureOr<ShopModel> Function(GetShopsByIDRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetShopsByIDProvider._internal(
        (ref) => create(ref as GetShopsByIDRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shopID: shopID,
      ),
    );
  }

  @override
  FutureProviderElement<ShopModel> createElement() {
    return _GetShopsByIDProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetShopsByIDProvider && other.shopID == shopID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetShopsByIDRef on FutureProviderRef<ShopModel> {
  /// The parameter `shopID` of this provider.
  String get shopID;
}

class _GetShopsByIDProviderElement extends FutureProviderElement<ShopModel>
    with GetShopsByIDRef {
  _GetShopsByIDProviderElement(super.provider);

  @override
  String get shopID => (origin as GetShopsByIDProvider).shopID;
}

String _$getCategoriesByCakesHash() =>
    r'2c782652306580335764445b5bae207fa6b9f285';

/// See also [getCategoriesByCakes].
@ProviderFor(getCategoriesByCakes)
const getCategoriesByCakesProvider = GetCategoriesByCakesFamily();

/// See also [getCategoriesByCakes].
class GetCategoriesByCakesFamily
    extends Family<AsyncValue<List<Map<String, dynamic>>>> {
  /// See also [getCategoriesByCakes].
  const GetCategoriesByCakesFamily();

  /// See also [getCategoriesByCakes].
  GetCategoriesByCakesProvider call({
    required List<CakeModel> cakes,
  }) {
    return GetCategoriesByCakesProvider(
      cakes: cakes,
    );
  }

  @override
  GetCategoriesByCakesProvider getProviderOverride(
    covariant GetCategoriesByCakesProvider provider,
  ) {
    return call(
      cakes: provider.cakes,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCategoriesByCakesProvider';
}

/// See also [getCategoriesByCakes].
class GetCategoriesByCakesProvider
    extends FutureProvider<List<Map<String, dynamic>>> {
  /// See also [getCategoriesByCakes].
  GetCategoriesByCakesProvider({
    required List<CakeModel> cakes,
  }) : this._internal(
          (ref) => getCategoriesByCakes(
            ref as GetCategoriesByCakesRef,
            cakes: cakes,
          ),
          from: getCategoriesByCakesProvider,
          name: r'getCategoriesByCakesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCategoriesByCakesHash,
          dependencies: GetCategoriesByCakesFamily._dependencies,
          allTransitiveDependencies:
              GetCategoriesByCakesFamily._allTransitiveDependencies,
          cakes: cakes,
        );

  GetCategoriesByCakesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cakes,
  }) : super.internal();

  final List<CakeModel> cakes;

  @override
  Override overrideWith(
    FutureOr<List<Map<String, dynamic>>> Function(
            GetCategoriesByCakesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCategoriesByCakesProvider._internal(
        (ref) => create(ref as GetCategoriesByCakesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cakes: cakes,
      ),
    );
  }

  @override
  FutureProviderElement<List<Map<String, dynamic>>> createElement() {
    return _GetCategoriesByCakesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCategoriesByCakesProvider && other.cakes == cakes;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cakes.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCategoriesByCakesRef on FutureProviderRef<List<Map<String, dynamic>>> {
  /// The parameter `cakes` of this provider.
  List<CakeModel> get cakes;
}

class _GetCategoriesByCakesProviderElement
    extends FutureProviderElement<List<Map<String, dynamic>>>
    with GetCategoriesByCakesRef {
  _GetCategoriesByCakesProviderElement(super.provider);

  @override
  List<CakeModel> get cakes => (origin as GetCategoriesByCakesProvider).cakes;
}

String _$shopHash() => r'd28f0e0fa623ad2182f048b305defccffc4221a4';

/// See also [Shop].
@ProviderFor(Shop)
final shopProvider = NotifierProvider<Shop, ShopModel?>.internal(
  Shop.new,
  name: r'shopProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$shopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Shop = Notifier<ShopModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
