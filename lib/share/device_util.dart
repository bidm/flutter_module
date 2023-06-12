import 'dart:core';
import 'package:flutter/cupertino.dart';

class DeviceConst {

  static double screenWidth(BuildContext ctx) {
    double ratio = DeviceConst.screenRatio(ctx);
    double width = MediaQuery.of(ctx).size.width;
    double widthX = width / ratio;
    return MediaQuery.of(ctx).size.width;
  }

  static double screenHeight(BuildContext ctx) {
    return MediaQuery.of(ctx).size.height;
  }

  static double screenRatio(BuildContext ctx) {
    return MediaQuery.of(ctx).devicePixelRatio;
  }
}