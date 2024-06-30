import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count_provider.g.dart';

// @Riverpod(keepAlive: true)
@riverpod
class Count extends _$Count {
  @override
  String build() {
    return 'firster';
  }

  Count() : super();

  setCount() {
    state = '233232x';
  }
}
