import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/constants.dart';
import 'package:simple_mobile_app_template/general/utils/general.dart';
import 'package:simple_mobile_app_template/ui/base_menu/base_menu.dart';
import 'package:simple_mobile_app_template/ui/not_found/not_found.dart';
import 'package:simple_mobile_app_template/ui/onboarding/introduction_page.dart';
import 'package:simple_mobile_app_template/ui/product_details/product_detail.dart';

import 'routes.dart';

MaterialPageRoute initialAppPageRouteBuilder(RouteSettings settings) {
  Map routes = {
    Routes.basePage: const BaseMenuPage(),
    Routes.onboarding: const IntroductionPage(),
    Routes.unknown: NotFoundPage(settings.name ?? "/"),

    /// Different Routes
    Routes.productDetails: CoffeeDetails(
      image: const AssetImage("assets/images/coffee1_details.png"),
      title: "Cappucino",
      rating: 4.9,
      views: 50,
      subtitle: "With Chocolate",
      coffeeSize: CoffeeSize.small,
      notes: [Pair(Icons.grain, "Coffee"), Pair(Icons.grain, "Coffee"), Pair(null, "Medium Roast")],
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet. Tincidunt cras volutpat aliquam porttitor molestie. Netus neque, habitasse id vulputate proin cras. Neque, vel duis sit vel pellentesque tempor. A commodo arcu tortor arcu, elit. " *
              3,
    )
  };
  Widget route = routes[settings.name] ?? routes[Routes.unknown];

  return MaterialPageRoute<Widget>(
    builder: (context) {
      return route;
    },
    settings: settings,
  );
}
