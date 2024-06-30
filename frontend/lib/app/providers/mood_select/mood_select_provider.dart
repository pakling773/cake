import 'package:frontend/app/actions/cake_action.dart';
import 'package:frontend/app/models/cake_model.dart';
import 'package:frontend/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mood_select_provider.g.dart';

@Riverpod(keepAlive: true)
class MoodSelect extends _$MoodSelect {
  @override
  FutureOr<List<CakeModel>?> build() async {
    return null;
  }

  Future<void> getCakesByMood(List<String> moods) async {
    try {
      state = const AsyncLoading();
      final result = await CakeAction().getCakesByMood(moods);

      state = AsyncData(result);
    } catch (e, s) {
      logger.e(e);
      state = AsyncError(e, s);
    }
  }
}
