import 'package:ai_project/Layout/constants.dart';
import 'package:flutter/cupertino.dart';

class DeviceScreenListner {
  late double width, height;
  late ScreenSizeType type;
  DeviceScreenListner(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    if (width > 1000) {
      type = ScreenSizeType.wep;
    } else if (width > 700 && width <= 1000) {
      type = ScreenSizeType.tablet;
    } else {
      type = ScreenSizeType.mobile;
    }
  }
}
