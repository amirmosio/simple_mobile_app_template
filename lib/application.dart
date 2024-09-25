import 'package:flutter/material.dart';
import 'package:simple_mobile_app_template/app_core/theme.dart';
import 'package:simple_mobile_app_template/routing_config/base_navigator_route_builder.dart';
import 'package:simple_mobile_app_template/routing_config/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: BBTheme.theme,
      initialRoute: Routes.onboarding,
      onGenerateRoute: (settings) {
        return initialAppPageRouteBuilder(settings);
      },
    );
  }
}
