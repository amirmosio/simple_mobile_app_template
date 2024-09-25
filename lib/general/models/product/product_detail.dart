import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/constants.dart';
import 'package:simple_mobile_app_template/general/utils/general.dart';

class ProductDetailModel {
  AssetImage image;
  String title;
  String subtitle;
  double rating;
  List<Pair<IconData?, String>> notes;
  CoffeeSize coffeeSize;
  String description;
  int views;

  ProductDetailModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.notes,
      required this.coffeeSize,
      required this.description,
      required this.views});
}
