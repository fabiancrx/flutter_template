import 'dart:math';

import 'package:flutter/material.dart';

/// Helper extension to set textstyle properties in a postfix manner
/// example `TextStyles.body.bold.italic.letterSpace(1.6)`
extension TextStyleHelpers on TextStyle {
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle color(Color color) => copyWith(color: color);

  TextStyle letterSpace(double value) => copyWith(letterSpacing: value);
}

class Fonts {
  static String get body => "Lato";

  static String get title => "Roboto";
}

class FontSizes {
  static double scale = 1;

  static double get body => 14 * scale;

  static double get bodySm => 12 * scale;

  static double get title => 16 * scale;
}

class TextStyles {
  static TextStyle get bodyFont => TextStyle(fontFamily: Fonts.body);

  static TextStyle get titleFont => TextStyle(fontFamily: Fonts.title);

  static TextStyle get title => titleFont.copyWith(fontSize: FontSizes.title);

  static TextStyle get titleLight => title.copyWith(fontWeight: FontWeight.w300);

  static TextStyle get body => bodyFont.copyWith(fontSize: FontSizes.body, fontWeight: FontWeight.w300);

  static TextStyle get bodySm => body.copyWith(fontSize: FontSizes.bodySm);
}

double getResponsiveSmallFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 17, max: 18);

double getResponsiveLargeFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(BuildContext context, {double fontSize = 12, double max = 100}) {
  var responsiveSize = min(screenWidthFraction(context, 10) * (fontSize / 100), max);

  return responsiveSize;
}

double screenWidthFraction(context, int dividedBy) {
  return MediaQuery.of(context).size.width / dividedBy;
}
