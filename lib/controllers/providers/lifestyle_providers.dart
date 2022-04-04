import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api_controllers/lifestyle_api_controllers.dart';

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
  dynamic createOrderResponse;

  Future createOrder(Map formData) async {
    try {
      isLoading = true;
      notifyListeners();
      createOrderResponse = await repo!.createLifestyleOrder(formData);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
