import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/extensions/extensions.dart';
import 'package:simple_mobile_app_template/general/utils/general.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';

class ProductIngredientsAndNotes extends StatelessWidget {
  final List<Pair<IconData?, String>> notes;

  const ProductIngredientsAndNotes({super.key, required this.notes});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SU.relH(55, context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        color: ColorRes.uiGray60.withAlpha(55),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: notes
            .map<Widget>(
              (element) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    element.first != null
                        ? Padding(
                            padding: const EdgeInsets.only(right: 9.0),
                            child: Icon(element.first),
                          )
                        : const SizedBox.shrink(),
                    Text(
                      element.second,
                      style: BodySmAltTextStyle(color: ColorRes.tGray100),
                    )
                  ],
                );
              },
            )
            .toList()
            .withWidgetInBetween(VerticalDivider(
              indent: 14,
              endIndent: 14,
              color: ColorRes.uiGray100,
            )),
      ),
    );
  }
}
