import 'package:flutter/material.dart';
import '../presentation/library_dashboard_screen/library_dashboard_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String libraryDashboardScreen = '/library_dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    libraryDashboardScreen: (context) => LibraryDashboardScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => LibraryDashboardScreen(),
  };
}
