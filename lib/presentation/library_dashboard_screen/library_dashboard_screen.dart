import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_bottom_bar.dart';
import '../../widgets/custom_gradient_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../../widgets/custom_search_view.dart';
import './widgets/statistics_card_widget.dart';

class LibraryDashboardScreen extends StatelessWidget {
  LibraryDashboardScreen({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final List<CustomBottomBarItem> bottomBarItemList = [
    CustomBottomBarItem(
      icon: ImageConstant.imgVectorWhiteA700,
      routeName: AppRoutes.libraryDashboardScreen,
    ),
    CustomBottomBarItem(
      icon: ImageConstant.imgVectorGray800,
      routeName: '/bookmark',
    ),
    CustomBottomBarItem(icon: ImageConstant.imgSearch, routeName: '/search'),
    CustomBottomBarItem(
      icon: ImageConstant.imgVectorGray80032x32,
      routeName: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.white_A700,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 1706.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  _buildContentSection(context),
                  _buildHeaderSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        bottomBarItemList: bottomBarItemList,
        selectedIndex: 0,
        onChanged: (index) {
          _onBottomBarChanged(context, index);
        },
      ),
    );
  }

  Widget _buildHeaderSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 40.h, right: 24.h, left: 24.h),
        child: Column(
          spacing: 24.h,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildWelcomeHeader(context),
            _buildSearchSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgRectangle14,
            width: double.infinity,
            height: 170.h,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 24.h),
              width: 276.h,
              child: Column(
                spacing: 4.h,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Selamat Datang di',
                    style: TextStyleHelper.instance.headline32BoldOutfit
                        .copyWith(height: 1.28),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.h),
                      gradient: LinearGradient(
                        begin: Alignment(0.164, -1.0),
                        end: Alignment(0.164, 1.0),
                        colors: [Color(0xFF43CCA4), Color(0xFF216652)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: appTheme.teal_300_01,
                          blurRadius: 18.h,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 6.h, left: 18.h),
                      child: Text(
                        'Salahudin Library',
                        style: TextStyleHelper.instance.headline29BoldOutfit
                            .copyWith(height: 1.31),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return CustomSearchView(
      controller: searchController,
      placeholder: 'Search a book...',
      rightIcon: ImageConstant.imgGroup14,
      onRightIconTap: () => _onSearchTap(context),
      onChanged: (value) => _onSearchChanged(value),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(top: 260.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: appTheme.blue_gray_100,
          borderRadius: BorderRadius.circular(12.h),
          boxShadow: [
            BoxShadow(
              color: appTheme.black_900_26,
              offset: Offset(0, 2.h),
              blurRadius: 9.h,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(26.h),
          child: Row(
            spacing: 16.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeftStatistics(context),
              _buildRightFeatures(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftStatistics(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: appTheme.white_A700,
          borderRadius: BorderRadius.circular(6.h),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 16.h),
        child: Column(
          spacing: 18.h,
          children: [
            StatisticsCardWidget(
              title: 'Pengguna',
              count: '13',
              iconPath: ImageConstant.imgGroup60,
              onTap: () => _onUserStatsTap(context),
            ),
            StatisticsCardWidget(
              title: 'Peminjaman',
              count: '02',
              iconPath: ImageConstant.imgVector,
              onTap: () => _onLoanStatsTap(context),
            ),
            StatisticsCardWidget(
              title: 'Donasi buku',
              count: '09',
              iconPath: ImageConstant.imgStreamlineStic,
              onTap: () => _onDonationStatsTap(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRightFeatures(BuildContext context) {
    return Container(
      width: 192.h,
      child: Column(
        spacing: 16.h,
        children: [
          _buildFeatureButtons(context),
          _buildVerificationSection(context),
        ],
      ),
    );
  }

  Widget _buildFeatureButtons(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        borderRadius: BorderRadius.circular(6.h),
      ),
      padding: EdgeInsets.symmetric(horizontal: 26.h, vertical: 18.h),
      child: Row(
        spacing: 24.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomGradientIconButton(
            iconPath: ImageConstant.imgGroup70,
            onPressed: () => _onBookCatalogTap(context),
          ),
          CustomGradientIconButton(
            iconPath: ImageConstant.imgGroup71,
            onPressed: () => _onTagManagementTap(context),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.white_A700,
        borderRadius: BorderRadius.circular(6.h),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
      child: Column(
        spacing: 6.h,
        children: [
          Container(
            width: double.infinity,
            height: 88.h,
            decoration: BoxDecoration(
              color: appTheme.cyan_50,
              borderRadius: BorderRadius.circular(5.h),
              boxShadow: [
                BoxShadow(
                  color: appTheme.black_900_26,
                  offset: Offset(0, 1.h),
                  blurRadius: 14.h,
                ),
              ],
            ),
            child: Center(
              child: CustomImageView(
                imagePath: ImageConstant.imgUnion,
                width: 76.h,
                height: 60.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: appTheme.white_A700,
              borderRadius: BorderRadius.circular(5.h),
              boxShadow: [
                BoxShadow(color: appTheme.black_900_26, blurRadius: 4.h),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.h),
            child: Text(
              'Verification KTP',
              style: TextStyleHelper.instance.label10BoldOutfit.copyWith(
                height: 1.3,
              ),
            ),
          ),
          Row(
            spacing: 10.h,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: appTheme.cyan_50_01,
                    borderRadius: BorderRadius.circular(5.h),
                    boxShadow: [
                      BoxShadow(color: appTheme.black_900_26, blurRadius: 4.h),
                    ],
                  ),
                  padding: EdgeInsets.all(4.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(
                          '05',
                          style: TextStyleHelper.instance.headline30BoldOutfit
                              .copyWith(height: 1.3),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appTheme.white_A700,
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, left: 10.h),
                          child: Text(
                            'Verified',
                            style: TextStyleHelper.instance.body15BoldOutfit
                                .copyWith(height: 1.27),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: appTheme.red_100,
                    borderRadius: BorderRadius.circular(5.h),
                    boxShadow: [
                      BoxShadow(color: appTheme.black_900_26, blurRadius: 4.h),
                    ],
                  ),
                  padding: EdgeInsets.all(4.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Text(
                          '8',
                          style: TextStyleHelper.instance.headline30BoldOutfit
                              .copyWith(color: appTheme.red_200, height: 1.3),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: appTheme.white_A700,
                          borderRadius: BorderRadius.circular(5.h),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 2.h, left: 12.h),
                          child: Text(
                            'Not yet',
                            style: TextStyleHelper.instance.body15BoldOutfit
                                .copyWith(
                                  color: appTheme.red_200_01,
                                  height: 1.27,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onSearchTap(BuildContext context) {
    // Handle search action
    print('Search tapped: ${searchController.text}');
  }

  void _onSearchChanged(String value) {
    // Handle search text changes
    print('Search changed: $value');
  }

  void _onBottomBarChanged(BuildContext context, int index) {
    // Handle bottom navigation
    if (index != 0) {
      Navigator.of(context).pushNamed(bottomBarItemList[index].routeName);
    }
  }

  void _onUserStatsTap(BuildContext context) {
    // Navigate to user statistics screen
    print('User statistics tapped');
  }

  void _onLoanStatsTap(BuildContext context) {
    // Navigate to loan statistics screen
    print('Loan statistics tapped');
  }

  void _onDonationStatsTap(BuildContext context) {
    // Navigate to donation statistics screen
    print('Donation statistics tapped');
  }

  void _onBookCatalogTap(BuildContext context) {
    // Navigate to book catalog screen
    print('Book catalog tapped');
  }

  void _onTagManagementTap(BuildContext context) {
    // Navigate to tag management screen
    print('Tag management tapped');
  }
}
