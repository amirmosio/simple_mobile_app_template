import 'package:flutter/material.dart';

class ProductItemModel {
  AssetImage image;
  String title;
  String subtitle;
  double rating;
  int view;

  ProductItemModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.view});
}
