import 'package:flutter/material.dart';

String _appTheme = "lightCode";
LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors(),
  };

  // A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme,
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    _appTheme = _newTheme;
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light();
}

class LightCodeColors {
  // App Colors
  Color get gray_600 => Color(0xFF838383);
  Color get white_A700 => Color(0xFFFFFFFF);
  Color get black_900_26 => Color(0x26000000);
  Color get teal_300 => Color(0xFF43CCA5);
  Color get teal_800 => Color(0xFF216652);
  Color get green_A200 => Color(0xFF51E2B8);
  Color get cyan_50 => Color(0xFFE4FFF7);
  Color get cyan_50_01 => Color(0xFFE5FFF8);
  Color get red_200 => Color(0xFFDC8B8B);
  Color get red_200_01 => Color(0xFFDD8B8B);
  Color get red_100 => Color(0xFFFFC8C8);
  Color get blue_gray_100 => Color(0xFFD8D8D8);
  Color get yellow_50 => Color(0xFFFFFAEC);
  Color get teal_300_01 => Color(0xFF3DBC98);
  Color get teal_300_02 => Color(0xFF43CCA4);
  Color get gray_800_b2 => Color(0xB24E4E4E);
  Color get gray_800 => Color(0xFF3F3F3F);
  Color get teal_400 => Color(0xFF39BC96);
  Color get teal_400_01 => Color(0xFF21A17C);
  Color get teal_700 => Color(0xFF06825E);

  // Additional Colors
  Color get transparentCustom => Colors.transparent;
  Color get whiteCustom => Colors.white;
  Color get greyCustom => Colors.grey;
  Color get colorFF8080 => Color(0xFF808080);
  Color get color3F43CC => Color(0x3F43CCA5);
  Color get colorFF4E4E => Color(0xFF4E4E4E);

  // Color Shades - Each shade has its own dedicated constant
  Color get grey200 => Colors.grey.shade200;
  Color get grey100 => Colors.grey.shade100;
}
