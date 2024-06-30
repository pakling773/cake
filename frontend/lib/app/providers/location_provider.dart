import 'package:frontend/main.dart';
import 'package:geocoding/geocoding.dart'
    show Placemark, placemarkFromCoordinates;
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_provider.g.dart';

@Riverpod(keepAlive: true)
Location locationService(LocationServiceRef ref) {
  return Location();
}

const kRetrieveLocationTimeout = Duration(seconds: 10);

@riverpod
Future<bool> deviceLocationEnabled(DeviceLocationEnabledRef ref) async {
  final location = ref.watch(locationServiceProvider);

  bool serviceEnabled;
  PermissionStatus permissionGranted;

  serviceEnabled = await location.serviceEnabled();

  if (!serviceEnabled) {
    // serviceEnabled = await location.requestService();
    // if (!serviceEnabled) {
    //   return null;
    // }
    return false;
  }

  permissionGranted = await location.hasPermission();

  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return false;
    }
  }

  return true;
}

//
@Riverpod(keepAlive: true)
Future<LocationData?> deviceLocation(DeviceLocationRef ref) async {
  final location = ref.watch(locationServiceProvider);

  final serviceEnabled = await ref.read(deviceLocationEnabledProvider.future);
  if (!serviceEnabled) return null;

  location.changeSettings(accuracy: LocationAccuracy.balanced);

  LocationData? locationData = await Future.any([
    location.getLocation(),
    Future.delayed(kRetrieveLocationTimeout, () => null)
  ]);
  // logger.i(locationData);

  return locationData;
}

//
@riverpod
Future<Placemark?> devicePlacemark(DevicePlacemarkRef ref) async {
  final deviceLocation = await ref.read(deviceLocationProvider.future);

  if (deviceLocation == null) return null;
  final LocationData(:latitude, :longitude) = deviceLocation;
  if (latitude == null || longitude == null) return null;
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);

  return placemarks.firstOrNull;
}
