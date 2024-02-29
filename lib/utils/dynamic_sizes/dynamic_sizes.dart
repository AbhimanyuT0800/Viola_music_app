import 'package:flutter/material.dart';

extension DynamicSizes on BuildContext {
  double screenHeight(double h) {
    return MediaQuery.sizeOf(this).height * (h / 1004);
  }

  double screenWidth(double w) {
    return MediaQuery.sizeOf(this).width * (w / 460);
  }
}
