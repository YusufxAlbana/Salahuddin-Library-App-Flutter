import 'package:flutter/material.dart';

import '../core/app_export.dart';
import './custom_image_view.dart';

/**
 * CustomBottomBar - A floating bottom navigation bar with gradient FAB
 * 
 * Features:
 * - Floating action button with gradient background for home
 * - Regular icon buttons for other navigation items
 * - Shadow effects and rounded corners
 * - Customizable navigation items and callbacks
 * 
 * @param bottomBarItemList List of navigation items with icons and routes
 * @param selectedIndex Current selected tab index (default: 0)
 * @param onChanged Callback function when tab is selected
 * @param backgroundColor Optional background color override
 */
class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({
    Key? key,
    required this.bottomBarItemList,
    required this.onChanged,
    this.selectedIndex = 0,
    this.backgroundColor,
  }) : super(key: key);

  /// List of bottom bar items with their properties
  final List<CustomBottomBarItem> bottomBarItemList;

  /// Current selected index of the bottom bar
  final int selectedIndex;

  /// Callback function triggered when a bottom bar item is tapped
  final Function(int) onChanged;

  /// Optional background color override
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24.h, right: 24.h, bottom: 14.h),
      height: 86.h,
      decoration: BoxDecoration(
        color: backgroundColor ?? appTheme.whiteCustom,
        borderRadius: BorderRadius.circular(28.h),
        boxShadow: [
          BoxShadow(
            color: appTheme.black_900_26,
            blurRadius: 13.h,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background image if needed
          Positioned.fill(
            child: CustomImageView(
              imagePath: ImageConstant.imgRectangle1,
              fit: BoxFit.fill,
            ),
          ),

          // Navigation items container
          Positioned(
            left: 53.h,
            right: 53.h,
            top: 14.h,
            bottom: 28.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomBarItemList.length, (index) {
                final item = bottomBarItemList[index];
                final isSelected = selectedIndex == index;

                if (index == 0) {
                  // First item as floating action button with gradient
                  return _buildFloatingActionButton(item, isSelected, index);
                } else {
                  // Regular navigation items
                  return _buildNavigationItem(item, isSelected, index);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton(
    CustomBottomBarItem item,
    bool isSelected,
    int index,
  ) {
    return GestureDetector(
      onTap: () => onChanged(index),
      child: Container(
        width: 58.h,
        height: 58.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.h),
          gradient: LinearGradient(
            begin: Alignment(-0.5, -1.0),
            end: Alignment(1.5, 2.0),
            colors: [
              Color(0xFF39BC96),
              appTheme.teal_400_01,
              appTheme.teal_700,
            ],
            stops: [0.0, 0.5, 1.0],
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.black_900_26,
              blurRadius: 13.h,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Center(
          child: CustomImageView(
            imagePath: isSelected ? item.activeIcon ?? item.icon : item.icon,
            width: 30.h,
            height: 30.h,
            color: appTheme.whiteCustom,
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem(
    CustomBottomBarItem item,
    bool isSelected,
    int index,
  ) {
    return GestureDetector(
      onTap: () => onChanged(index),
      child: Container(
        width: 32.h,
        height: 32.h,
        child: CustomImageView(
          imagePath: isSelected ? item.activeIcon ?? item.icon : item.icon,
          width: 32.h,
          height: 32.h,
          color: isSelected ? Color(0xFF39BC96) : appTheme.colorFF8080,
        ),
      ),
    );
  }
}

/// Item data model for custom bottom bar
class CustomBottomBarItem {
  CustomBottomBarItem({
    required this.icon,
    this.activeIcon,
    this.title,
    required this.routeName,
  });

  /// Path to the default icon
  final String icon;

  /// Path to the active state icon (optional)
  final String? activeIcon;

  /// Title text for the navigation item (optional)
  final String? title;

  /// Route name for navigation
  final String routeName;
}
