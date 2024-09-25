import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/constants.dart';
import 'package:simple_mobile_app_template/general/models/product/product_detail.dart';
import 'package:simple_mobile_app_template/general/utils/general.dart';

class ProductDetailProvider extends ChangeNotifier {
  ProductDetailModel? _productDetailModel;
  bool _isLoading = true;

  ProductDetailModel? get productDetailModel {
    return _productDetailModel;
  }

  bool get isLoading {
    return _isLoading;
  }

  fetchProductDetails() async {
    _isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;

    _productDetailModel = ProductDetailModel(
        image: const AssetImage(
          "assets/images/coffee1_details.png",
        ),
        rating: 4.9,
        subtitle: "With Chocolate",
        notes: [
          Pair(Icons.grain, "Coffee"),
          Pair(Icons.grain, "Coffee"),
          Pair(null, "Medium Roast")
        ],
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. " *
                3,
        coffeeSize: CoffeeSize.small,
        views: 50,
        title: "Cappucino");
    notifyListeners();
  }
}
