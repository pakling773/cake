import 'package:frontend/app/actions/place_action.dart';
import 'package:frontend/app/models/places/places_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'places_provider.g.dart';

@riverpod
class Place extends _$Place {
  @override
  List<Prediction>? build() {
    return [];
  }

  void getPlace(String query) async {
    final result = await PlaceAction().getPlaces(query: query);
    state = result?.predictions;
    // logger.d('state $state');
    // logger.d('result ${result?.predictions}');
  }
}
