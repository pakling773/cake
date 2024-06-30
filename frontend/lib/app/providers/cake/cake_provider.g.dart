// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cake_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCakesByShopIdHash() => r'ef8d21f14f0998a4eb40233682aa16e75c4f9f5a';

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

/// See also [getCakesByShopId].
@ProviderFor(getCakesByShopId)
const getCakesByShopIdProvider = GetCakesByShopIdFamily();

/// See also [getCakesByShopId].
class GetCakesByShopIdFamily extends Family<AsyncValue<List<CakeModel>>> {
  /// See also [getCakesByShopId].
  const GetCakesByShopIdFamily();

  /// See also [getCakesByShopId].
  GetCakesByShopIdProvider call(
    String shopId,
  ) {
    return GetCakesByShopIdProvider(
      shopId,
    );
  }

  @override
  GetCakesByShopIdProvider getProviderOverride(
    covariant GetCakesByShopIdProvider provider,
  ) {
    return call(
      provider.shopId,
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
  String? get name => r'getCakesByShopIdProvider';
}

/// See also [getCakesByShopId].
class GetCakesByShopIdProvider
    extends AutoDisposeFutureProvider<List<CakeModel>> {
  /// See also [getCakesByShopId].
  GetCakesByShopIdProvider(
    String shopId,
  ) : this._internal(
          (ref) => getCakesByShopId(
            ref as GetCakesByShopIdRef,
            shopId,
          ),
          from: getCakesByShopIdProvider,
          name: r'getCakesByShopIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCakesByShopIdHash,
          dependencies: GetCakesByShopIdFamily._dependencies,
          allTransitiveDependencies:
              GetCakesByShopIdFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  GetCakesByShopIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
  }) : super.internal();

  final String shopId;

  @override
  Override overrideWith(
    FutureOr<List<CakeModel>> Function(GetCakesByShopIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCakesByShopIdProvider._internal(
        (ref) => create(ref as GetCakesByShopIdRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shopId: shopId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CakeModel>> createElement() {
    return _GetCakesByShopIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCakesByShopIdProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCakesByShopIdRef on AutoDisposeFutureProviderRef<List<CakeModel>> {
  /// The parameter `shopId` of this provider.
  String get shopId;
}

class _GetCakesByShopIdProviderElement
    extends AutoDisposeFutureProviderElement<List<CakeModel>>
    with GetCakesByShopIdRef {
  _GetCakesByShopIdProviderElement(super.provider);

  @override
  String get shopId => (origin as GetCakesByShopIdProvider).shopId;
}

String _$getCategoriesHash() => r'2c85fbcbd45bde3745dc52dfc7148dfeb3b01553';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = FutureProvider<List<CategoryModel>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = FutureProviderRef<List<CategoryModel>>;
String _$getShopsHash() => r'd5c5a6f89e1b3b0b9422c835cfc883c400252e75';

/// See also [getShops].
@ProviderFor(getShops)
final getShopsProvider = FutureProvider<List<ShopModel>>.internal(
  getShops,
  name: r'getShopsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getShopsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetShopsRef = FutureProviderRef<List<ShopModel>>;
String _$cakeHash() => r'e84eabe762ef0d8d77b734eadf6891221778e0e6';

/// See also [Cake].
@ProviderFor(Cake)
final cakeProvider = NotifierProvider<Cake, List<CakeModel>?>.internal(
  Cake.new,
  name: r'cakeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cakeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cake = Notifier<List<CakeModel>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
