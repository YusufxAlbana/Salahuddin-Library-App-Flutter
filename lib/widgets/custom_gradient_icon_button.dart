import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomGradientIconButton - A reusable icon button with gradient background and shadow effects
 * 
 * Features:
 * - Gradient background from teal to dark green
 * - Consistent shadow and border radius styling
 * - SVG icon support through CustomImageView
 * - Configurable tap handling
 * - Responsive sizing using SizeUtils
 * 
 * @param iconPath - String path to the SVG icon asset
 * @param onPressed - VoidCallback function triggered when button is tapped
 * @param padding - EdgeInsets for internal button padding (optional)
 */
class CustomGradientIconButton extends StatelessWidget {
  CustomGradientIconButton({
    Key? key,
    required this.iconPath,
    this.onPressed,
    this.padding,
  }) : super(key: key);

  /// Path to the SVG icon asset
  final String iconPath;

  /// Callback function triggered when button is pressed
  final VoidCallback? onPressed;

  /// Internal padding for the button content
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      shadowColor: appTheme.color3F43CC,
      child: Container(
        height: 54.h,
        width: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.h),
          gradient: LinearGradient(
            begin: Alignment(-0.5, -1.0),
            end: Alignment(1.0, 1.0),
            colors: [Color(0xFF43CCA5), appTheme.teal_800],
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.color3F43CC,
              spreadRadius: 0,
              blurRadius: 11.h,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: appTheme.transparentCustom,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(5.h),
            child: Container(
              padding: padding ?? EdgeInsets.all(14.h),
              child: CustomImageView(imagePath: iconPath, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
