import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * A customizable search input field component with optional right icon and validation support.
 * 
 * This component provides a flexible search interface that can be used across different
 * screens with customizable appearance, placeholder text, and search functionality.
 * 
 * @param controller - TextEditingController for managing the search input
 * @param placeholder - Placeholder text shown when the field is empty
 * @param rightIcon - Optional icon path for the right side of the search field
 * @param onRightIconTap - Callback function when right icon is tapped
 * @param onChanged - Callback function when text changes
 * @param validator - Validation function for form validation
 * @param fillColor - Background color of the search field
 * @param borderColor - Border color of the search field
 * @param textColor - Text color for the input text
 * @param placeholderColor - Color for the placeholder text
 * @param borderRadius - Border radius for rounded corners
 * @param contentPadding - Internal padding for the search field
 */
class CustomSearchView extends StatelessWidget {
  CustomSearchView({
    Key? key,
    this.controller,
    this.placeholder,
    this.rightIcon,
    this.onRightIconTap,
    this.onChanged,
    this.validator,
    this.fillColor,
    this.borderColor,
    this.textColor,
    this.placeholderColor,
    this.borderRadius,
    this.contentPadding,
  }) : super(key: key);

  /// Controller for managing the text input
  final TextEditingController? controller;

  /// Placeholder text displayed when field is empty
  final String? placeholder;

  /// Path to the right icon image
  final String? rightIcon;

  /// Callback function when right icon is tapped
  final VoidCallback? onRightIconTap;

  /// Callback function when text changes
  final Function(String)? onChanged;

  /// Validation function for form validation
  final String? Function(String?)? validator;

  /// Background fill color of the search field
  final Color? fillColor;

  /// Border color of the search field
  final Color? borderColor;

  /// Text color for the input text
  final Color? textColor;

  /// Color for the placeholder text
  final Color? placeholderColor;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Internal padding for the search field content
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyleHelper.instance.title19RegularOutfit.copyWith(
        color: textColor ?? Color(0xFF4E4E4E),
      ),
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: placeholder ?? "Search a book...",
        hintStyle: TextStyleHelper.instance.title19RegularOutfit.copyWith(
          color: placeholderColor ?? Color(0xFFB24E4E4E),
        ),
        suffixIcon: rightIcon != null
            ? InkWell(
                onTap: onRightIconTap,
                child: Container(
                  padding: EdgeInsets.all(12.h),
                  child: CustomImageView(
                    imagePath: rightIcon!,
                    height: 34.h,
                    width: 42.h,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : null,
        filled: true,
        fillColor: fillColor ?? appTheme.whiteCustom,
        contentPadding:
            contentPadding ??
            EdgeInsets.only(top: 6.h, right: 56.h, bottom: 6.h, left: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
          borderSide: BorderSide(
            color: borderColor ?? Color(0x26000000),
            width: 1.h,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
          borderSide: BorderSide(
            color: borderColor ?? Color(0x26000000),
            width: 1.h,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 10.h),
          borderSide: BorderSide(
            color: borderColor ?? Color(0x26000000),
            width: 1.h,
          ),
        ),
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
