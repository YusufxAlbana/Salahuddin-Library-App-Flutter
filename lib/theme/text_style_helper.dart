import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline32BoldOutfit => TextStyle(
    fontSize: 32.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Outfit',
    color: appTheme.white_A700,
  );

  TextStyle get headline30BoldOutfit => TextStyle(
    fontSize: 30.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Outfit',
    color: appTheme.green_A200,
  );

  TextStyle get headline29BoldOutfit => TextStyle(
    fontSize: 29.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Outfit',
    color: appTheme.yellow_50,
  );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title19RegularOutfit => TextStyle(
    fontSize: 19.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Outfit',
  );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15BoldOutfit => TextStyle(
    fontSize: 15.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Outfit',
    color: appTheme.green_A200,
  );

  // Label Styles
  // Small text styles for labels, captions, and hints

  TextStyle get label10BoldOutfit => TextStyle(
    fontSize: 10.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Outfit',
    color: appTheme.gray_600,
  );
}
