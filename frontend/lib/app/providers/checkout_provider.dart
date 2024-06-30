import 'package:frontend/app/models/checkout_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkout_provider.g.dart';

@Riverpod(keepAlive: true)
class Checkout extends _$Checkout {
  @override
  CheckoutModel build() {
    return CheckoutModel();
  }

  setData(CheckoutModel data) async {
    state = data;
  }
}
