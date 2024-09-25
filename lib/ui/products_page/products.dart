import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/headings.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/providers/product/product_list_provider.dart';
import 'package:simple_mobile_app_template/providers/product/special_offer_product_provider.dart';
import 'package:simple_mobile_app_template/ui/products_page/product_carousel.dart';

import 'filter_item_widget.dart';
import 'special_offer_item_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SpecialOfferProductProvider()),
          ChangeNotifierProvider(create: (_) => ProductListProvider()),
        ],
        builder: (context, snapshot) {
          return Consumer(builder: (context, provider, child) {
            return ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: SU.relH(24, context),
                      left: SU.relW(36, context),
                      right: SU.relW(36, context)),
                  child: const Text(
                    "Categories",
                    style: H4TextStyle(),
                  ),
                ),
                SizedBox(
                  height: SU.relH(30, context),
                  child: Row(
                    children: [
                      SizedBox(
                        width: SU.relW(36, context),
                      ),
                      Expanded(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          for (String filter in ["Cappuccino", "Cold Brew", "Expresso"])
                            Padding(
                              padding: EdgeInsets.only(right: SU.relW(13, context)),
                              child: FilterItem(
                                title: filter,
                                icon: Icons.coffee,
                                isSelected: filter == "Cappuccino",
                              ),
                            ),
                        ],
                      ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: SU.relH(8, context)),
                  child: const ProductCarousel(),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: SU.relH(36, context),
                      left: SU.relW(36, context),
                      right: SU.relW(36, context)),
                  child: Row(
                    children: [
                      const Text(
                        "Special Offer",
                        style: H4TextStyle(),
                      ),
                      Icon(
                        Icons.local_fire_department,
                        color: ColorRes.accentOrange,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 8, left: SU.relW(36, context), right: SU.relW(36, context)),
                  child: SizedBox(
                    height: SU.relH(120, context),
                    child: const SpecialOfferItemWidget(),
                  ),
                )
              ],
            );
          });
        });
  }
}
