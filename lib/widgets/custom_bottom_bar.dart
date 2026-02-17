import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'custom_image_view.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({
    required this.bottomBarItemList,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<CustomBottomBarItem> bottomBarItemList;
  final int selectedIndex;
  final Function(int) onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black_900_26,
            offset: Offset(0, 0),
            blurRadius: 4.h,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(widget.bottomBarItemList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: widget.bottomBarItemList[index].icon,
              height: 24.h,
              width: 24.h,
              color: appTheme.gray_600,
            ),
            activeIcon: CustomImageView(
              imagePath: widget.bottomBarItemList[index].icon,
              height: 24.h,
              width: 24.h,
              color: appTheme.teal_300,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          widget.onChanged(index);
        },
      ),
    );
  }
}

class CustomBottomBarItem {
  CustomBottomBarItem({
    required this.icon,
    required this.routeName,
  });

  String icon;
  String routeName;
}
