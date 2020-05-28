import 'package:flutter/material.dart';

class SurveySizes {
  static const double standardDistance = 30.0;
  static const double smallDistance = 10.0;
  static const double paddingSize = 50.0;
  static const double buttonSize = 70.0;
  static const double buttonIconSize = 40.0;
  static const double imageWidth = 320.0;

  static const double smallFontSize = 14.0;
  static const double regularFontSize = 20.0;
  static const double questionFontSize = 30.0;
  static const double bigFontSize = 50.0;
  static const double buttonFontSize = 22.0;

  static const double targetHeight = 960.0;
  static const double targetWidth = 600.0;

  static double scaledWidth(double width, BuildContext context) =>
      width * MediaQuery.of(context).size.width / targetWidth;

  static double scaledHeight(double height, BuildContext context) =>
      height * MediaQuery.of(context).size.height / targetHeight;

  SurveySizes._();
}
