import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/constants.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/headings.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/utils/general.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/general/widgets/rating_tag.dart';
import 'package:simple_mobile_app_template/providers/product/product_details_provider.dart';
import 'package:simple_mobile_app_template/ui/product_details/product_ingredients_and_notes_widget.dart';

class CoffeeDetails extends StatefulWidget {
  final AssetImage image;
  final String title;
  final String subtitle;
  final double rating;
  final List<Pair<IconData?, String>> notes;
  final CoffeeSize coffeeSize;
  final String description;
  final int views;

  const CoffeeDetails(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.rating,
      required this.notes,
      required this.coffeeSize,
      required this.description,
      required this.views});

  @override
  State<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) {
          return ProductDetailProvider()..fetchProductDetails();
        },
        child: Consumer<ProductDetailProvider>(builder: (context, p, child) {
          if (p.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: false,
                expandedHeight: 450,
                collapsedHeight: 75,
                floating: true,
                leadingWidth: 55,
                leading: Container(
                  margin: const EdgeInsets.only(left: 10, top: 5),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: ColorRes.uiGray20),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    padding: const EdgeInsets.only(left: 6),
                    alignment: Alignment.center,
                    color: ColorRes.primaryBrown,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                forceMaterialTransparency: false,
                backgroundColor: ColorRes.tGray80,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: widget.image, alignment: Alignment.topCenter)),
                  ),
                ),
                bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(155),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Container(
                            color: const Color.fromARGB(85, 0, 0, 0),
                            padding: EdgeInsets.only(
                                left: SU.relW(20, context),
                                right: SU.relW(20, context),
                                top: SU.relH(9, context),
                                bottom: SU.relH(12, context)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: H3TextStyle(color: ColorRes.tWhite),
                                      ),
                                      Text(
                                        widget.subtitle,
                                        style: HintTextStyle(color: ColorRes.tWhite),
                                      )
                                    ],
                                  ),
                                ),
                                RatingTag(
                                  rating: widget.rating,
                                  scale: 1.3,
                                  textStyle: H5TextStyle(color: ColorRes.tWhite),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: const Color.fromARGB(85, 0, 0, 0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
                                color: ColorRes.bgGray20,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: SU.relH(21, context)),
                              child: ProductIngredientsAndNotes(notes: widget.notes),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: ColorRes.bgGray20,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: SU.relW(20, context)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Coffee Size",
                          style: H4TextStyle(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SU.relH(16, context)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              for (CoffeeSize c in CoffeeSize.values)
                                SizedBox(
                                  height: SU.relH(40, context),
                                  width: SU.relW(98, context),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: c == CoffeeSize.small
                                            ? WidgetStateProperty.all(ColorRes.primaryBrown)
                                            : null,
                                        elevation: WidgetStateProperty.all(3),
                                        shape: WidgetStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                30), // Set the border radius here
                                          ),
                                        )),
                                    onPressed: () {},
                                    child: Text(
                                      c.name,
                                      style: BodyRegTextStyle(
                                          color: c == CoffeeSize.small
                                              ? ColorRes.tWhite
                                              : ColorRes.tGray100),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: SU.relH(33, context)),
                          child: const Text(
                            "About",
                            style: H4TextStyle(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: SU.relH(10, context)),
                          child: Text(
                            widget.description,
                            style: const BodyRegTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: SU.relH(25, context)),
                          child: Container(
                            height: 75,
                            padding: EdgeInsets.symmetric(horizontal: SU.relW(19, context)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(33), color: Colors.brown),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Center(
                                  child: Text(
                                    "Add to Cart",
                                    style: BodyLgTextStyle(color: ColorRes.tWhite),
                                  ),
                                )),
                                const VerticalDivider(
                                  endIndent: 13,
                                  indent: 13,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: SU.relW(32, context)),
                                  child: Text(
                                    "${widget.views}k",
                                    style: H4TextStyle(color: ColorRes.tWhite),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
