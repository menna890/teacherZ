import 'package:flutter/material.dart';
import 'package:teacherz/models/draweritem.dart';

class NavigationHelper {
  static void handleNavigation(
    BuildContext context,
    String? currentRoute,
    DrawerItem item,
  ) {

    _tryCloseDrawer(context);
    if (currentRoute != item.route) {
      _navigateToRoute(context, item.route);
    }
  }

  static void _tryCloseDrawer(context) {
    try {
      
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    } catch (e) {
      
      debugPrint('Error closing drawer: $e');
    }
  }

  static void _navigateToRoute(context, String route) {
    try {
      Navigator.pushNamed(context, route);
    } catch (e) {
      debugPrint('Error navigating to route: $e');
    }
  }
}
