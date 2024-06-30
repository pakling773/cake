import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/app/common/cake_sizes.dart';
import 'package:frontend/app/models/module_enum.dart';
import 'package:frontend/app/models/order_summary/order_summary_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_summary_provider.g.dart';

@Riverpod(keepAlive: true)
class OrderSummary extends _$OrderSummary {
  final minSize = cakeSizes[0];
  @override
  OrderSummaryRequestModel? build() {
    return null;
  }

  Future<dynamic> saveOrder(OrderSummaryRequestModel data) async {
    try {
      final jsonData = data.toJson();

      final orderCollection =
          FirebaseFirestore.instance.collection(ModulesEnum.orders.name);

      return await orderCollection.add(jsonData);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        throw Exception('Error: Permission denied');
        // Handle specific error for permission denied
      } else if (e.code == 'unavailable') {
        throw Exception('Error: service is unavailable');
        // Handle specific error for service unavailable
      } else {
        throw Exception('Error saving order to server: ${e.message}');
      }
    } catch (e, stackTrace) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
