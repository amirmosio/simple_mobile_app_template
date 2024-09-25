import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/headings.dart';
import 'package:simple_mobile_app_template/app_core/text_styles/texts.dart';
import 'package:simple_mobile_app_template/general/utils/size_utils.dart';
import 'package:simple_mobile_app_template/ui/products_page/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: SU.relW(36, context), left: SU.relW(36, context), right: SU.relW(36, context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: CircleAvatar(
                  radius: SU.relW(30, context),
                  child: Image.asset("assets/images/circular_avatar.png"),
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: ColorRes.primaryBrown,
                    ),
                    const Text(
                      "Bintara, Bekasi",
                      style: H6TextStyle(),
                    ),
                  ],
                ),
              ),
              const Flexible(flex: 1, child: Icon(Icons.notification_add))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: SU.relH(14, context), left: SU.relW(36, context), right: SU.relW(36, context)),
          child: const Text(
            "Good morning, Dityo",
            style: H4TextStyle(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: SU.relH(32, context), left: SU.relW(36, context), right: SU.relW(36, context)),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search Coffee",
                hintStyle: BodySmTextStyle(color: ColorRes.uiGray40),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_alt),
                filled: true,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: ColorRes.uiGray20),
            style: const BodySmTextStyle(),
          ),
        ),
        const Expanded(child: ProductsPage())
      ],
    );
  }
}
