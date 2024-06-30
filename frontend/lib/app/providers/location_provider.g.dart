// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationServiceHash() => r'16d4601df832f5d415cad6903523eddb47658156';

/// See also [locationService].
@ProviderFor(locationService)
final locationServiceProvider = Provider<Location>.internal(
  locationService,
  name: r'locationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationServiceRef = ProviderRef<Location>;
String _$deviceLocationEnabledHash() =>
    r'69b576642209e7ff949ed176a00d5540d8df510b';

/// See also [deviceLocationEnabled].
@ProviderFor(deviceLocationEnabled)
final deviceLocationEnabledProvider = AutoDisposeFutureProvider<bool>.internal(
  deviceLocationEnabled,
  name: r'deviceLocationEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceLocationEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceLocationEnabledRef = AutoDisposeFutureProviderRef<bool>;
String _$deviceLocationHash() => r'88ba9d6bba2090e0ec515f89b1d45df66e966887';

/// See also [deviceLocation].
@ProviderFor(deviceLocation)
final deviceLocationProvider = FutureProvider<LocationData?>.internal(
  deviceLocation,
  name: r'deviceLocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deviceLocationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeviceLocationRef = FutureProviderRef<LocationData?>;
String _$devicePlacemarkHash() => r'5d2259fb4fccf5ee57e3b2a222afe165d52d5f1b';

/// See also [devicePlacemark].
@ProviderFor(devicePlacemark)
final devicePlacemarkProvider = AutoDisposeFutureProvider<Placemark?>.internal(
  devicePlacemark,
  name: r'devicePlacemarkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$devicePlacemarkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DevicePlacemarkRef = AutoDisposeFutureProviderRef<Placemark?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
