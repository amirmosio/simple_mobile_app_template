import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/headings.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/providers/product/special_offer_product_provider.dart';

class SpecialOfferItemWidget extends StatefulWidget {
  const SpecialOfferItemWidget({super.key});

  @override
  State<SpecialOfferItemWidget> createState() => _SpecialOfferItemWidgetState();
}

class _SpecialOfferItemWidgetState extends State<SpecialOfferItemWidget> {
  @override
  void initState() {
    Provider.of<SpecialOfferProductProvider>(context, listen: false).fetchSpecialOfferData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.all(SU.relW(7, context)),
          child: Consumer<SpecialOfferProductProvider>(builder: (context, p, child) {
            if (p.isLoading) {
              return Shimmer.fromColors(
                baseColor: ColorRes.uiWhite,
                highlightColor: ColorRes.uiGray40,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration:
                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                ),
              );
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: SU.relW(129, context),
                  height: SU.relW(99, context),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: p.productItemModel!.image, fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: SU.relW(13, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16), color: ColorRes.primaryBrown),
                        child: Text(
                          "Limited",
                          style: AltBoldHintTextStyle(color: ColorRes.tWhite),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: SU.relW(10, context)),
                          child: Text(
                            p.productItemModel!.text,
                            style: const H5TextStyle(),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
