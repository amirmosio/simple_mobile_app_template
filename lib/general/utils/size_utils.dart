import 'package:flutter/cupertino.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SU {
  /// Design time screen size
  /// With this set, we can easily calculate relative sizes if needed
  static const _screenWidth = 375;
  static const _screenHeight = 812;

  SU._privateConstructor();

  static double forceBetweenMinMax(double min, double max, double value) {
    if (value > max) {
      return max;
    } else if (value < min)
      // ignore: curly_braces_in_flow_control_structures
      return min;
    else
      // ignore: curly_braces_in_flow_control_structures
      return value;
  }

  static double max(double v1, double v2) {
    if (v1 > v2) {
      return v1;
    } else {
      return v2;
    }
  }

  static double min(double v1, double v2) {
    if (v1 < v2) {
      return v1;
    } else {
      return v2;
    }
  }

  static double relW(double x, BuildContext context, {double? max}) {
    double width = MediaQuery.of(context).size.width;
    double res = x * (width / _screenWidth);
    return max != null ? min(res, max) : res;
  }

  static double relH(double y, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return y * (height / _screenHeight);
  }

  static double mediaQueryWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double mediaQueryHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Mobile sized
  static bool isMSized(BuildContext context) {
    return getDeviceType(MediaQuery.of(context).size) == DeviceScreenType.mobile;
  }

  /// Desktop sized or table sized
  static bool isDSized(BuildContext context) {
    return getDeviceType(MediaQuery.of(context).size) != DeviceScreenType.mobile;
  }

  static T? cond<T>(BuildContext context, {T? mobile, T? desktop}) {
    if (SU.isMSized(context)) return mobile;
    return desktop;
  }
}
