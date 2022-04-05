import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/lifestyle/order_process_model.dart';
import '../api_controllers/lifestyle_api_controllers.dart';

final lifestyleProcessStateProvider = StateProvider<LifestyleOrderProcessModel>(
    (ref) => LifestyleOrderProcessModel(
          processId: '',
          totalAmount: '',
          orderId: '',
          paymentId: '',
          status: '',
        ));

final verifyLifestylePaymentFutureProvider =
    FutureProvider.autoDispose.family((ref, String id) async {
  final apiService = ref.read(lifestyleApiProvider);
  return apiService.verifyPayment(id);
});

final lifestyleChangeNotifier =
    ChangeNotifierProvider<LifeStyleChangeNotifier>((ref) {
  return LifeStyleChangeNotifier(ref: ref);
});

class LifeStyleChangeNotifier extends ChangeNotifier {
  Ref? ref;
  LifestyleApiControllers? repo;
  LifeStyleChangeNotifier({this.ref}) {
    repo = ref!.read(lifestyleApiProvider);
  }

  bool isLoading = false;

  dynamic error;
  dynamic initOrderResponse;
  dynamic addOrderItemsResponse;

  Future createOrder(Map formData) async {
    try {
      isLoading = true;
      notifyListeners();
      initOrderResponse = await repo!.initLifestyleOrder(formData);
    } catch (e) {
      error = e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future addOrderItems(Map formData) async {
    try {
      isLoading = true;
      notifyListeners();
      addOrderItemsResponse = await repo!.addOrderItems(formData);
    } catch (e) {
      error = e;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
