import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:simple_mobile_app_template/app_core/colors.dart';
import 'package:simple_mobile_app_template/routing_config/routes.dart';
import 'package:simple_mobile_app_template/ui/home/home.dart';

class BaseMenuPage extends StatefulWidget {
  const BaseMenuPage({super.key});

  @override
  State<BaseMenuPage> createState() => _BaseMenuPageState();
}

class _BaseMenuPageState extends State<BaseMenuPage> {
  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      context,
      screens: [const HomePage(), Container(), Container(), Container()],
      controller: _controller,
      items: [
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.house_fill),
          title: "Home",
          activeColorPrimary: ColorRes.primaryBrown,
          inactiveColorPrimary: ColorRes.uiGray40,
          // textStyle: H6TextStyle(),
          // / TODO I foun this bug in package which can be easily resolved, but i don't think that it is neccessary for not

          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              Routes.productDetails: (final context) =>
                  Container(color: Colors.white, child: const Text("hey")),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.heart_fill),
          title: ("Favourite"),
          activeColorPrimary: ColorRes.primaryBrown,
          inactiveColorPrimary: ColorRes.uiGray40,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const HomePage(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.cart_fill),
          title: ("Cart"),
          activeColorPrimary: ColorRes.primaryBrown,
          inactiveColorPrimary: ColorRes.uiGray40,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const HomePage(),
            },
          ),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(CupertinoIcons.profile_circled),
          title: ("Profile"),
          activeColorPrimary: ColorRes.primaryBrown,
          inactiveColorPrimary: ColorRes.uiGray40,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: "/",
            routes: {
              "/first": (final context) => const HomePage(),
              "/second": (final context) => const HomePage(),
            },
          ),
        )
      ],
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: ColorRes.bgGray20,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight + 5,
      navBarStyle: NavBarStyle.style3,
      padding: const EdgeInsets.only(bottom: 6),
    ));
  }
}
