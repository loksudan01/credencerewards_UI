import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_controllers/lifestyle_api_controllers.dart';

final sectionStateProvider = StateProvider<int>((ref) => 0);


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
      rethrow;
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
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
