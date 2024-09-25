import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';

class FilterItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const FilterItem({super.key, required this.title, required this.icon, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () {
          /// TODO
        },
        child: Container(
          width: SU.relW(99, context),
          decoration: BoxDecoration(
              color: isSelected ? ColorRes.primaryBrown : ColorRes.uiWhite,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SU.relW(7, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  icon,
                  size: 17,
                  color: isSelected ? ColorRes.tWhite : ColorRes.tGray80,
                ),
                Text(
                  title,
                  style: LabelTextStyle(color: isSelected ? ColorRes.tWhite : ColorRes.tGray80),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
