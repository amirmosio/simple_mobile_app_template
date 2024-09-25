import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/models/product/product_item.dart';
import 'package:simple_mobile_app_template/general/utils/general.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/general/widgets/rating_tag.dart';
import 'package:simple_mobile_app_template/ui/product_details/product_detail.dart';

import '../../app_core/constants.dart';

class ProductItemWidget extends StatefulWidget {
  final ProductItemModel productItemModel;

  const ProductItemWidget({super.key, required this.productItemModel});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return CoffeeDetails(
                  image: const AssetImage("assets/images/coffee1_details.png"),
                  title: "Cappucino",
                  rating: 4.9,
                  views: 50,
                  subtitle: "With Chocolate",
                  coffeeSize: CoffeeSize.small,
                  notes: [
                    Pair(Icons.grain, "Coffee"),
                    Pair(Icons.grain, "Coffee"),
                    Pair(null, "Medium Roast")
                  ],
                  description:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. " *
                          3,
                );
              },
            ));
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(SU.relW(7, context)),
            child: SizedBox(
              width: SU.relW(129, context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: SU.relW(129, context),
                        height: SU.relH(99, context),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: widget.productItemModel.image, fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      Padding(
                        padding: EdgeInsets.all(SU.relW(6, context)),
                        child: RatingTag(
                          rating: widget.productItemModel.rating,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productItemModel.title,
                            style: const BodyRegTextStyle(),
                          ),
                          Text(
                            widget.productItemModel.subtitle,
                            style: const HintTextStyle(),
                          ),
                          Text(
                            "${widget.productItemModel.view}K",
                            style: const BodySmAltTextStyle(),
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.add_circle,
                            size: 30,
                            color: ColorRes.primaryBrown,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
