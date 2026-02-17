import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../widgets/custom_gradient_icon_button.dart';

class StatisticsCardWidget extends StatelessWidget {
  final String title;
  final String count;
  final String iconPath;
  final VoidCallback? onTap;

  StatisticsCardWidget({
    Key? key,
    required this.title,
    required this.count,
    required this.iconPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        spacing: 4.h,
        children: [
          Container(
            decoration: BoxDecoration(
              color: appTheme.white_A700,
              borderRadius: BorderRadius.circular(5.h),
              boxShadow: [
                BoxShadow(color: appTheme.black_900_26, blurRadius: 4.h),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
            child: Text(
              title,
              style: TextStyleHelper.instance.label10BoldOutfit.copyWith(
                height: 1.3,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: appTheme.white_A700,
              borderRadius: BorderRadius.circular(5.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.black_900_26,
                  offset: Offset(0, 2.h),
                  blurRadius: 9.h,
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: Row(
              spacing: iconPath == ImageConstant.imgVector ? 20.h : 22.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomGradientIconButton(
                  iconPath: iconPath,
                  padding: EdgeInsets.all(14.h),
                ),
                Container(
                  width: iconPath == ImageConstant.imgVector ? 40.h : 36.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          count,
                          style: TextStyleHelper.instance.headline32BoldOutfit
                              .copyWith(
                                color: appTheme.green_A200,
                                height: 1.28,
                              ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 36.h,
                          height: 6.h,
                          decoration: BoxDecoration(
                            color: appTheme.green_A200,
                            borderRadius: BorderRadius.circular(2.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
