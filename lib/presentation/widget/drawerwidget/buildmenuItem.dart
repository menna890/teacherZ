import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:teacherz/constant/colors.dart';
import 'package:teacherz/data/drawertem.dart';
import 'package:teacherz/helper/navigation_helper.dart';

class BuildMenuItem extends StatelessWidget {
  final int index;
  final double fontSize;
  const BuildMenuItem({super.key, required this.index, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)!.settings.name;

    return ListTile(
      leading: Icon(
        drawerItems[index - 1].icon,
        color:
            currentRoute == drawerItems[index - 1].route
                ? kPrimaryColor
                : Colors.grey,
      ),
      title: AutoSizeText(
        drawerItems[index - 1].title,
        minFontSize: 10,
        maxFontSize: 12,
        style: TextStyle(
          fontSize: fontSize,
          color:
              currentRoute == drawerItems[index - 1].route
                  ? kPrimaryColor
                  : Colors.grey,
        ),
      ),
      selected: currentRoute == drawerItems[index - 1].route,
      selectedTileColor: Colors.deepPurple.withOpacity(0.1),
      onTap:
          () => NavigationHelper.handleNavigation(
            context,
            currentRoute,
            drawerItems[index - 1],
          ),
    );
  }
}
