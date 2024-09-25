import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';

class RatingTag extends StatelessWidget {
  final double rating;
  final TextStyle? textStyle;
  final double scale;

  const RatingTag({super.key, required this.rating, this.textStyle, this.scale = 1});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(16), color: ColorRes.primaryBrown),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5 * scale, vertical: 2 * scale),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.star,
                size: 16 * scale,
                color: ColorRes.uiGray20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3 * scale),
                child: Text(
                  "$rating",
                  style: textStyle ?? HintTextStyle(color: ColorRes.tWhite),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
