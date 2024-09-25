import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/general/extensions/extensions.dart';
import 'package:simple_mobile_app_template/general/models/product/product_item.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/providers/product/product_list_provider.dart';
import 'package:simple_mobile_app_template/ui/products_page/category_item_widget.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({super.key});

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  @override
  void initState() {
    Provider.of<ProductListProvider>(context, listen: false).fetchProductsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SU.relH(175, context),
      child: Row(
        children: [
          Expanded(child: Consumer<ProductListProvider>(builder: (context, p, child) {
            if (p.isLoading) {
              return Shimmer.fromColors(
                baseColor: ColorRes.uiWhite,
                highlightColor: ColorRes.uiGray40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: SU.relW(36, context),
                    ),
                    Container(
                      width: SU.relW(129, context),
                      height: SU.relH(99, context),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                    ),
                    Container(
                      width: SU.relW(129, context),
                      height: SU.relH(99, context),
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(15)),
                    )
                  ].withChildPadding(
                      EdgeInsets.only(right: SU.relW(13, context), top: 8, bottom: 8)),
                ),
              );
            }
            return ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: <Widget>[
                    SizedBox(
                      width: SU.relW(36, context),
                    )
                  ] +
                  [
                    for (ProductItemModel prod in p.products!)
                      Padding(
                        padding: EdgeInsets.only(right: SU.relW(13, context)),
                        child: ProductItemWidget(productItemModel: prod),
                      )
                  ],
            );
          }))
        ],
      ),
    );
  }
}
