import 'package:frontend/app/environment/environment.dart';
import 'package:frontend/app/models/places/places_model.dart';
import 'package:frontend/main.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class PlaceAction {
  String? get placeApiKey => Environment.instance.envPlaceApiKey;

  Future<PlaceResponse?> getPlaces({
    required String query,
  }) async {
    try {
      final Uri uri =
          Uri.https('maps.googleapis.com', 'maps/api/place/autocomplete/json', {
        "input": query,
        "key": placeApiKey,
        "types": "geocode",
      });

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final place = placeResponseFromJson(response.body);
        return place;
      }
    } catch (e) {
      logger.e(e);
      throw Exception('Failed to get place: $e');
    }

    return null;
  }

  getUserLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        logger.i('SERVICE NOT ENABLED');
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        logger.i('no location permission');
        return;
      }
    }
    logger.i('HAS location permission');

    _locationData = await location.getLocation();
    logger.i(_locationData);
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   logger.i(currentLocation);
    //   // Use current location
    // });
    return _locationData;
  }
}
