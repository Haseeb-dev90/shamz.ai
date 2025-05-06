import 'package:flutter/material.dart';
import 'package:shamz_ai/app_exports.dart';

class AppTypography {
  static const String fontFamily = 'unbounded';

  /// Font Sizes
  static const double microTextSize = 8.0;
  static const double minimumSize = 10.0;
  static const double captionSize = 12.0;
  static const double secondaryTextSize = 14.0;
  static const double bodyTextSize = 16.0;
  static const double buttonTextSize = 24.0;
  static const double bigBodyTextSize = 18.0;
  static const double subheadingSize = 20.0;
  static const double h3Size = 22.0;
  static const double h2Size = 26.0;
  static const double h1Size = 32.0;

  /// Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  /// Spacing constants
  static const double spaceSmall = 10.0;
  static const double spaceSmall2 = 15.0;
  static const double spaceSmall3 = 20.0;

  static const double spaceMedium = 30.0;
  static const double spaceMedium2 = 40.0;

  static const double spaceLarge = 60.0;

  /// Text Styles
  static TextStyle debugTextStyle = TextStyle(
      fontFamily: fontFamily,
      fontSize: captionSize,
      fontStyle: FontStyle.italic);

  static TextStyle get minimum =>
      getTextStyle(fontSize: minimumSize, fontWeight: regular);
  static TextStyle get caption =>
      getTextStyle(fontSize: captionSize, fontWeight: regular);
  static TextStyle get secondaryText =>
      getTextStyle(fontSize: secondaryTextSize, fontWeight: light);
  static TextStyle get bodyText =>
      getTextStyle(fontSize: bodyTextSize, fontWeight: regular);
  static TextStyle get bigBodyText =>
      getTextStyle(fontSize: bigBodyTextSize, fontWeight: regular);
  static TextStyle get subheading =>
      getTextStyle(fontSize: subheadingSize, fontWeight: semiBold);

  static TextStyle get h3 => getTextStyle(fontSize: h3Size, fontWeight: medium);
  static TextStyle get h2 =>
      getTextStyle(fontSize: h2Size, fontWeight: semiBold);
  static TextStyle get h1 => getTextStyle(fontSize: h1Size, fontWeight: bold);

  static TextStyle get title =>
      getTextStyle(fontSize: h3Size, fontWeight: semiBold);
  static TextStyle get subtitle =>
      getTextStyle(fontSize: subheadingSize, fontWeight: regular);
  static TextStyle get buttonText => getTextStyle(
        fontSize: buttonTextSize,
        fontWeight: regular,
      );
  static TextStyle get overline =>
      getTextStyle(fontSize: captionSize, fontWeight: light);

  static TextStyle getTextStyle(
      {required double fontSize,
      Color fontColor = Colors.black,
      FontWeight fontWeight = AppTypography.regular,
      double fontHeight = 1.5,
      TextOverflow overflow = TextOverflow.ellipsis}) {
    try {
      return TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: fontWeight,
          height: fontHeight,
          fontFamily: fontFamily,
          overflow: overflow);
    } catch (e) {
      return TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: fontWeight,
          height: fontHeight,
          overflow: overflow);
    }
  }
}
