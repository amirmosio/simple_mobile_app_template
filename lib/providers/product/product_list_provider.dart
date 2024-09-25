import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/general/models/product/product_item.dart';

class ProductListProvider extends ChangeNotifier {
  List<ProductItemModel>? _products;
  bool _isLoading = true;

  List<ProductItemModel>? get products {
    return _products;
  }

  bool get isLoading {
    return _isLoading;
  }

  fetchProductsList() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
    _products = [
      ProductItemModel(
          image: const AssetImage("assets/images/coffee1.png"),
          title: "Cappucino",
          subtitle: "With Chocolate",
          rating: 4.9,
          view: 50),
      ProductItemModel(
          image: const AssetImage("assets/images/coffee2.png"),
          title: "Cappucino",
          subtitle: "With Low Fat Milk",
          rating: 4.7,
          view: 45),
      ProductItemModel(
          image: const AssetImage("assets/images/coffee2.png"),
          title: "Cappucino",
          subtitle: "With Low Fat Milk",
          rating: 4.7,
          view: 45),
    ];
  }
}
