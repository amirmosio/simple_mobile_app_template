import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/general/models/product/special_product_item.dart';

class SpecialOfferProductProvider extends ChangeNotifier {
  SpecialProductItemModel? _productItemModel;
  bool _isLoading = true;

  SpecialProductItemModel? get productItemModel {
    return _productItemModel;
  }

  bool get isLoading {
    return _isLoading;
  }

  fetchSpecialOfferData() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    _productItemModel = SpecialProductItemModel(
        image: const AssetImage("assets/images/coffee3.png"),
        text: "Buy 1 get 1 free\nif you buy with\nGopay");
    notifyListeners();
  }
}
